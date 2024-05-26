# in Ruby, only false and nill are falsy values, 0 and '', are not

#IF STATEMENTS
 #syntax 
  # if statement_to_be_evaluted == true 
    # do this 
  # elsif
    #do this
  # else 
    #do this
  #end
  
  # can be written in one line without end if it's concise enough 

#UNLESS
  # is basically !true
  # unless age < 18 will execute the code in any case except if age < 18

#BOOLEAN LOGIC
  # eql? - checks for both value and data type equality
  # equal? - checks whether both values reffer to the same object in memory 
    # integers will return true
    # strings will return false
  # <=> - spaceship operator
    # returns -1 if left is < than right
    # 0 if they are equal 
    # 1 if left is > than right
    # used in sorting functions
  
#LOGICAL OPERATORS
  # && has the highest precedence
  # 'or' and 'and' also exist in ruby, but have lower precedence than their counterparts
  # ||= can be used to chec if a variable already has a value assigned to it, and if not, to give it one
    # a ||= b
#CASE STATEMENTS
  # evaluates a conditional and return the specified value 
  # syntax 
    # case value 
      # when .. then ..
      # when .. then ..
      # else ..
    # end
  # then can be removed and the code placed on the next line, like in  JS switch
  # can also be written without a value, in which case you'd have to write: 
    # case 
    #   when a == 5
    #     puts "a is 5"
    #   when a == 6 
    #     puts "a is 6"
    # end