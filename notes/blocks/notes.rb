# YIELD
  # allows the creation of methods that can accept blocks
    @transactions = [10, -15, 25, 30, -24, -70, 999]

    def transaction_statement
      @transactions.each do |transaction|
        yield transaction # Yields the transaction to the block, allowing the user to handle it.
      end
    end

    transaction_statement do |transaction|
      p "%0.2f" % transaction # The bank that calls the method can define how it is handled.
    end
    #=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]

  # block_given? - a check for a block that allows defining different behaviours

# LAMBDA 
  # used to store blocks
    my_lambda = lambda { |age| puts "I am #{age} years old" }

    my_other_lambda = ->(name) { puts "hello #{name}" }

  # my_lambda.call will call the block
    # other ways:
      my_lambda.("tim")
      my_lambda["tim"]
      my_lambda.=== "tim"
  # pointy lambdas use arguments with ()
  # regular lambads use pipes ||

# PROCS
  # like lambdas, but a Proc is an object, while lambda is a type of proc
    a_proc = Proc.new { puts "this is a proc" }
    b_proc = proc { puts "this is a proc" } # different way to create a proc
    c_proc = Proc.new { |name, age| puts "name: #{name} --- age: #{age}" } # arguments in pipes
    c_proc.call("tim", 80)

# PROC VS LAMBDA
  # proc doesn't care about number or presence of arguments, lambda will raise errors
  # proc returns from call context, lambda returns to caller
    # this means that returning a proc in global context will raise an error, but not a lambda
    def my_method
      puts 'this will be printed'
      a_proc = Proc.new { return }
      puts "this line will also be printed"
      a_proc.call
      puts "this line is never reached"
    end

    my_method

  # they support default arguments
  # both can be used as arguments to a method
  # both have CLOSURE
    # they remember the reference point of the variables from the context they were called in, meaning they will 
    # know and update the values as needed

# CAPTURING BLOCKS
  # using & calls .to_proc on the object
    def cool_method(&my_block) # the argument is made into a proc
      my_block.call # the proc is called
    end

    cool_method { puts "cool" }

  # & can be used to call other methods
    arr = ["1", "2", "3"]

    arr.map(&:to_i) # notice the method is called via a symbol
    # => [1, 2, 3]

  # & can also be used to unproc a proc object and remake it into a regular block
    def cool_method
      yield # yield requires a block, so a proc object would give an error
    end

    my_proc = Proc.new { puts "proc party" }

    cool_method(&my_proc)
    # => proc party
