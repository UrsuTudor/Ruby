#BEGIN...RESCUE
  # used to wrap parts of the program that could fail
    # parts that rely on user input
    # parts that rely on downloading webpages
    # etc.

require 'open-uri'
require 'timeout'

remote_base_url = "http://en.wikipedia.org/wiki"

start_year = 1900
end_year = 2000

(start_year..end_year).each do |yr|
 begin
   rpage = open("#{remote_base_url}/#{yr}")
 rescue StandardError=>e
   puts "Error: #{e}"
 else
   rdata = rpage.read
 ensure   
   puts "sleeping"
   sleep 5
 end
     
 if rdata
   File.open("copy-of-#{yr}.html", "w"){|f| f.write(rdata) }
 end
end   

  # begin 
    # starts the exception-handling block 
    # the operation/s that are at risk of failing should be inside
      # opening the page on line 17 could fail if the page is down 
  # rescue
    # what happens on exception
      # StandardError can be used to trigger the rescus on an error with the StandardError class 
  # else 
    # where the program goes if there is no error
  # ensure 
    # will execute whether en error/exception was rescued or not

#RETRY
  # redirects program to the begin statement
  # open-uri will make is to ensure will not execute on retries if there was an error

#EXCEPTION FAMILY TREE
  Exception
    NoMemoryError
    ScriptError
        LoadError
        NotImplementedError
        SyntaxError
    SignalException
        Interrupt
    StandardError
        ArgumentError
        IOError
            EOFError
        IndexError
            StopIteration
        LocalJumpError
        NameError
            NoMethodError
        RangeError
            FloatDomainError
        RegexpError
        RuntimeError
        SecurityError
        SystemCallError
        SystemStackError
        ThreadError
        TypeError
        ZeroDivisionError
    SystemExit
    fatal   