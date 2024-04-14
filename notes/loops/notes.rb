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

  #for loop 
    #used to iterate through an array or a range 
    #returns the collection of elements it has looped over
    #syntax: 
      # for i in 0..5 
        # ...this (no do this time)
      #end
  
  #each 
    #used for arrays 
    #syntax 
      # array.each do |element| 
        # ...this
      #end 


#BREAK AND NEXT
  #break will break the loop 
  #next will skip an iteration and execute the next one