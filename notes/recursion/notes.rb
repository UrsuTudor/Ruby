require 'pry-byebug'

# PRINCIPLES
  # recursion must have an end goal/base case (the last two rocks)
  # a process in which the task at hand is reduced towards that end goal

  # solving the problem with a loop
    rocks = 30.times.map{rand(200) + 1}
    puts rocks.join(', ')
    max_rock = 0

    rocks.each do |rock|
      max_rock = rock if max_rock < rock
    end

    puts "Heaviest rock is: #{max_rock}"

  # solving the problem with recursion (on the else clause, a and b call the method)
    def rock_judger(rocks_arr)
      if rocks_arr.length <= 2 # the base case
        a = rocks_arr[0]
        b = rocks_arr[-1]
      else
        a = rock_judger(rocks_arr.slice!(0,rocks_arr.length/2))
        b = rock_judger(rocks_arr)
      end

      a > b ? a : b
    end

    rocks = 30.times.map{rand(200) + 1}
    puts rocks.join(', ')
    puts "Heaviest rock is: #{rock_judger(rocks)}"

# IMPLEMENTANTION ISSUES
  # call stack issues due to insufficient memory
  # compilars may save more information in the recursion stack than neccessary
    # minimize paramaters and internal variables of the recursive procedure
    # or use an explicit stack structure
  # choosing the base case: 
    # choosing the smallest or simplest base case is usually simpler
    # choosing a larger base case and solving it non-recursively can be more efficient
  # for subproblems that end up being evaluated many times
    # memorize the solutions
    # or take it to the extreme and implement dynamic programming 
# EXERCISE
  def collatz(num, steps = 0)
    if num == 1
      puts steps
      return
    end

    if num.even?
      collatz(num / 2, steps + 1)
    end

    if num.odd?
      collatz(num * 3 + 1, steps + 1)
    end
  end

  collatz(27)
