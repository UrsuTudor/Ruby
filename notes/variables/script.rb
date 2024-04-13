#STORING VARIABLES
  # a = 4
  # b = a => b = 4
  # a = 7 => b still = 4 because in ruby, redeclaring a still creates an object with a new id, an b was assigned to the old object id

#GETTING DATA FROM USERS
  # gets 
    # stands for 'get string'
    # waits for user to type information and press enter
    # gets.chomp will get rid of the newline character
  
#VARIABLE SCOPE
  # methods (functions in JS language) can only access and modify variables declared internally 
  # blocks (code that follows a menthod, delimited by {} or do/end) can access and modify global variables

#VARIBALE TYPES
  # constants - declared by capitalizing every letter in the name 
  # global - declared with $ at the start of the name...usually avoided
  # class - declared with @@, used when you need a variable related to a class, but the instances of the class don't need their own values 
  # instance - declared with @, available through the current instance of the parent class, breaking scope boundaries
  # local - regular variables
  
