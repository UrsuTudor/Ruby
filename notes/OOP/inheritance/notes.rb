class Animal 
  def speak 
    "Hello!"
  end

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def speak 
    super + ",says the dog."
  end

  def initialize(color, name)
    super(name)
    @color = color
  end

  #include Swimmable
end

class Cat < Animal
end

sparky = GoodDog.new("golden", "Sparky")
paws = Cat.new("Paws")
puts sparky.speak
p sparky
puts paws.speak

#GENERAL INFO
  # subclass < superclass is how we assign the methods of one parent class to a child class
  # if an inherited method shares a name with a an in-class method, the in-class method takes priority

#SUPER KEYWORD
  # used when defining a method with the same name as the inherited one
  # calls that inherited method within the in-class one 
  # see line 8
  # often used with initialize to note generic info that all subclasses of the superclass will have (such as @n)
    #see line 16

#MODULES
  # uses: 
    # good for methods that are used by multiple subclasses, but not by all the children of a superclass 

    module Swimmable 
     def swim 
      "I can swim!"
      end
    end
  
    class Fish < Animal 
      include Swimmable
    end
      # and Dog wlill have to include swimmable as well
      # but maybe you will have to introduce an animal that can't swim
      # that's why you make a swimmable module

   # for namespacing 
      # aka organizing similar classes under a module like so:
        module Mammal 
          class Dog 
						DOG_YEARS = 7
						
						def initialize(age)
							@age = age
						end

            def speak(sound)
              p "#{sound}"
            end

						def public_disclosure
							"This dog's age in human years is #{human_years}"
						end

						private

						def human_years
							@age * DOG_YEARS
						end
          end

            class Cat 
            def say_name(name)
              p "#{name}"
            end
          end
        end
    
     # calling classes hidden inside modules is done with ::
        buddy = Mammal::Dog.new(3)
        kitty = Mammal::Cat.new
        buddy.speak("Woof!")
        kitty.say_name("kitty")

    # for methods that would be out of place in other areas of the code 
        module Aquatic_creature 
          def self.out_of_place_fish_method(gill_type)
            gill_type
          end
        end
        carp = Aquatic_creature::out_of_place_fish_method("weird")
        p carp

#WHEN TO USE 
  # use inheritance if the class can be described as an "is-a" 
    # dog is an animable 
  # use modules if the class "has-a" ability to do x 
    # do has an ability to swim 

#LOOKUP PATH
  # class > modules > superclass > modules of superclass > object > Kernel > BasicObject (this is an example)
  # last element added is first in the lookup path 

#ACCESS CONTROL					
  # in Ruby, access is generally restricted from methods defined in a class 
	# done through the public, private and protected access modifiers 
	# by default, methods are public 
	# when to use: 
	  # private when a method only needs to do work in the class and doesn't need to be available to other instances of the class, only to self
		  # human_years method in line 73 is a good example, so setting private before it achieves that
				# buddy.human_years(7) return this error now: private method `human_years' called for #<Mammal::Dog:0x00007f21206699a8> (NoMethodError)
				# the method can still be accessed by other methods from within the class that are not private, such as:
					p buddy.public_disclosure
		# protected when a method only needs to work in the class, but needs to be available to other instances of it too 
		  # in the example below, because the :age reader is protected, it cannot be accessed from the outside, but the older function can use it
			class Person
				def initialize(age)
					@age = age
				end
		
				def older?(other_person)
					age > other_person.age
				end
		
				protected
		
				attr_reader :age
			end
		
			malory = Person.new(64)
			sterling = Person.new(42)
		
			malory.older?(sterling)  # => true
			sterling.older?(malory)  # => false
			#malory.age # => error
				
#PRACTICE ROOM
class Vehicle 
	@@number_of_vehicles = 0

	def initialize(year)
		@@number_of_vehicles += 1
		@year = year
	end

	def self.gas_mileage(miles, fuel_consumed)
		puts "#{miles/fuel_consumed} miles per gallon of gas."
	end

	def vehicle_count
		puts "At the moment, the number of vehicles in the garage is #{@@number_of_vehicles}."
	end

	def display_age 
		puts "This vehicle is #{calculate_age} years old!"
	end

	private 
	
	def calculate_age 
		current_time = Time.new
		return current_time.year - @year
	end
end

class MyCar < Vehicle
	SEATS = 5
end

module Towable
  def can_tow?(pounds)
    puts pounds < 2000
  end
end

class MyTruck < Vehicle
	SEATS = 8

	include Towable
end

car = MyCar.new(2002)
truck = MyTruck.new(2010)
truck.can_tow?(1000)

car.vehicle_count

puts MyCar.ancestors

car.display_age

class Student 
	def initialize(name, grade)
		@name = name 
		@grade = grade 
	end
	attr_accessor :name 
	def better_grade_than?(student)
		self.grade > student.grade
	end 
	protected
	attr_reader :grade
end

joe = Student.new("Joe", 8)
bob = Student.new("Bob", 7)

puts "Let's go, Joe!" if joe.better_grade_than?(bob)