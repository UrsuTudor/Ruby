# frozen_string_literal: true

require 'pry-byebug'

dictionary = '%w'['below', 'down', 'go', 'going', 'horn', 'how', 'howdy', 'it',
                  'i', 'low', 'own', 'part', 'partner', 'sit']

def substrings(string, dictionary)
  occurences = Hash.new(0)
  string_to_array = string.downcase.split

  # goes through dictionary and checks if any of the words are included in elements of the given string
  dictionary.each do |word|
    string_to_array.each do |element|
      occurences[word] += 1 if element.include?(word)
    end
  end
  p occurences
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
