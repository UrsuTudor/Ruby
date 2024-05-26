#CREATING HASHES
  my_hash = {
    "a random word" => "ahoy",
    "an array" => [1, 2, 3],
    "an empty hash within a hash" => {}
  }

  # symbols accept a more JS syntax for hashes 

  symbols_hash = {
    hello_there: "General Kenobi",
    over: "I have the highground"
  }

#ACCESSING VALUES
  my_hash['a random word']
  #accessing a value that doesn't exist returns nil 

  #use .fetch to make sure you don't siently return nil
    #.fetch(key, 'message to give on error')
  
#CHANGING DATA
  my_hash["fall"] = "sneakers" #adds a key
  my_hash["an array"] = [1,2] # changes array
  my_hash.delete("fall") #removes fall

#METHODS
  # .fetch - read on accessing values
  # .keys - returns keys
  # .key?() - checks if a hash contains a specific key
  # .select() - filter for hashes
  # .values - returns values 
  # .merge() - allows merging of two hashes
  # .to_a - return an array version of a hash

#LOOPING
  #similar to arrays, but include an argument for both key and value

#HASHES AS OPTIONAL PARAMETERS 
  #hashes can be used as method arguments in clever ways
  
    def greeting(name, options = {})
      if options.empty?
        puts "Hi, my name is #{name}"
      else
        puts "Hi, my name is #{name} and I'm #{options[:age]}" +
            " years old and I live in #{options[:city]}."
      end
    end

