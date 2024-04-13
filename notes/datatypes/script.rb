#CLASSES
  #every datatype is an object and every object has a class 
    # 3.class => Fixnum
    # 3.3.class => Float 
    #classes have the Class class too => Float.class => Class

#NUMBERS
  #operations with integers always return int, so do 7/5.0 to get a float result
  
  #methods
    #.to+f makes 13 a 13.0 float
    #.to_i makes 13.9 a 13 int
    #.even checks if the number is even 
    #.odd cheks if the number is odd

  #modulo vs remainder (% vs .remainder)
    #modulo returns negative when the 2nd operand is negative
    #remainder returns negative when the first operand is negative 
    #divmod returns the result of the division and the modulo result

#STRINGS
  #string interpolation and escape characters only work with ""
  #concatenation 
    #with +
    #with <<
    #with .concat

  #substrings
    #by accessing the indexes of the individual characters
    #for string = "hello"
      #"hello"[0, 4] => "hell"
    
  #escape characters 
    #\\ backslash
    #\b backscape
    # \r carriage return 
    # \n newline 
    # \s space
    # \t tab
    # \" double quotation mark
    # \' single quotation mark

  #interpolation 
    # name = 'Odin'
    # puts "Hello, #{name}" => Hello, Odin; only with ""

  #methods 
    # .capitalize 
    # .include?("what inclusion you want to check")
    # .upcase
    # .downcase 
    # .empty?
    # .length
    # .reverse
    # .split (makes an array out of the string)
    # .strip (removes spaces at the end)
    # "he77o".sub("7", "l")           => "hel7o"

    # "he77o".gsub("7", "l")          => "hello"

    # "hello".insert(-1, " dude")     => "hello dude"

    # "hello world".delete("l")       => "heo word"

    # "!".prepend("hello, ", "world") => "hello, world!"


  #conversion to string with to_s

#SYMBOLS
  #values that are stored in memory only once
  #creating symbols: ':' at the start of the line
  #symbols are often used for refferecing things you don't intend to print

#BOOLEANS
  #ruby booleans can have nil as a returned value, which basically means nothing

#nil 
  #.nil? checks if smth is nil 
  #nil in an if statement is equal to false 

#HASHES
  #sets of key-value pairs, much like objects in js
  #syntax 
    #{:dog => 'barks',
    # :cat => 'meows'}
      #to call: 
        # hash[:cat]