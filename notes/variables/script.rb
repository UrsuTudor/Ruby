#STORING VARIABLES
  # a = 4
  # b = a => b = 4
  # a = 7 => b still = 4 because in ruby, redeclaring a still creates an object with a new id, an b was assigned to the old object id

#INPUT AND OUTPUT
  # gets 
    # stands for 'get string'
    # waits for user to type information and press enter
    # gets.chomp will get rid of the newline character

  # puts 
    #writes the data and jumps to the next line
    #tries to convert everything into a string with to_s

  # putc - writes the first character of the data 

  # p 
    # writes a more 'raw' version of data than puts => p "Hello world" => "Hello world" as opposed to just Hello world without the ""
    # returns the object it was called on as opposed to returning nill

  # pp - prints big hashes and arrays in a nicer way 

  # print - writes the data without jumping to the next line

  
#VARIABLE SCOPE
  # methods (functions in JS language) can only access and modify variables declared internally 
  # blocks (code that follows a menthod, delimited by {} or do/end) can access and modify global variables

#VARIBALE TYPES
  # constants - declared by capitalizing every letter in the name 
  # global - declared with $ at the start of the name...usually avoided
  # class - declared with @@, used when you need a variable related to a class, but the instances of the class don't need their own values 
  # instance - declared with @, available through the current instance of the parent class, breaking scope boundaries
  # local - regular variables
  
