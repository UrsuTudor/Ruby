# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone_number)
  numbers = '1234567890'

  phone_number = phone_number.split('').filter { |character| numbers.include?(character) }

  if phone_number.length < 10 || phone_number.length == 11 && phone_number[0] != '1' || phone_number.length > 11
    'Incorrect phone number.'
  elsif phone_number.length == 10
    phone_number.join
  elsif phone_number.length == 11 && phone_number[0] == '1'
    phone_number.drop(1).join
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

registered_per_hour = {}

def peak_hours(reg_hour, registered_per_hour)
  if registered_per_hour[:"#{reg_hour}"]
    registered_per_hour[:"#{reg_hour}"] += 1
  else
    registered_per_hour[:"#{reg_hour}"] = 1
  end

  peak_hours = Hash[registered_per_hour.filter { |hour| registered_per_hour[:"#{hour}"] > 1 }.sort]
  puts peak_hours
end

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  phone_number = clean_phone_number(row[:homephone])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)

  peak_hours(Time.parse(row[:regdate].split[1]).hour, registered_per_hour)
end
