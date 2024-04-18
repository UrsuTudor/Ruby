#LOOP TYPES
  #loop
    #loop do
      # ...this 
      #break if ...condition
    #end
  
  #while 
    # while ...x do 
      #...this
    #end
  
  #until 
    #until ...x do 
      #...this
    #end 
  
  #ranges can be used to set how many times you want a loop to run 

  #times 
    # run a specified number of times 
    # 5.times do 
      #...this 
    #end 
  
  #upto and downto 
    # 5.upto(10) 
    # 10.downto(5)

#BREAK AND NEXT
  #break will break the loop 
  #next will skip an iteration and execute the next one

#ENUMERABLES
  # loop methods for arrays and hashes
  
  # each 
    # array.each do |element|
    # for hashes: 
      # hash.each |key, value| will asign key to key, value to value 
      # hash.each |pair| will work on the pair elements at the same time, using and returning them as an array of 2
    # returns the originals, not the resulting elements

  # each_with_index
    # array.each_with_index |element, index|

  # map  
    # acts like in JS, returning the results in a new array
    # array.map |element|
    # array.map.with_index - allows use of index

  # select 
    # filter from JS
    # array.select |element|
    # hash.select |key, value| value == 'whatever'
  
  # reject
    # opposite of select, returns array without elements that return true on condition

  # detect
    # returns first element that is true on condition 

  # reduce  
    # same as JS
    # array.reduce(initial value of result) |result, current element|

  # any?
    # returns true if any element matches condition 
  
  # all?
    # returns true if every element matches condition 

  # none?
    # opposite of all

  # one?
    # checks if exactly one elements passes the condition

  # include? 
    # array.include?(element)