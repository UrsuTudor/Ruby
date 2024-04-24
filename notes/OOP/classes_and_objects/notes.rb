#OOP TERMS
  # encapsulation - making pieces of funtionality unavailable to the rest of the code base (through objects/methods)
  # polymorphism - the ability of different data types to respond to common methods or modules
  # inheritance - a class inheriting the behaviors of another class

#RUBY SPECIFICS 
  # every item that has a class is an object
  # classes determine the attributes and behavoirs of objects

#CLASSES
  class GoodDog
    #modules
  end
  sparky = GoodDog.new # this is called instantiating an object called sparky from the class GoodDog

  # classes have states(what data is associated to a certain object of the class) and behaviors 
    # states are tracked via instance variables
    # Speak is a behavior

  #initializing an object
    # adding a `def initialize` method to a class will run it every time a new object of that class is created
    class Example 
      def initialize 
        puts "This is an example of initialize!"
      end
    end

  #instance variables
    class Person
      def initialize(n, h, w)
        @name = n
        @height = h 
        @weight = w
      end

      def introduction
       "Hi, my name is #{name}!"
      end

      # def get_name 
      #   @name
      # end

      # def name 
      #   @name 
      # end

      # def name=(n)
      #   @name = n
      # end

      attr_accessor :name, :height, :weight

      def change_info(n ,h ,w)
        self.name = n
        self.height = h 
        self.weight = w
      end

      def info 
        puts "#{name} weighs #{weight} and is #{height} tall."
      end
    end
    # @name is an instance variable that can be called from withing the class
      bob = Person.new("Bob", "32 inches", "57 pounds") #sets @name to Bob for the bob variable
    # instance variables contain data that is individually scoped for each object 
      # you may have 10 CoffeMachine objects that each have an individual @water_level variable 

  #instance methods 
    # methods can be added much like instance varialbes, see class above
      puts bob.introduction

  #accesor methods
    #methods that allow you to access and manipulate the data of an object; see lines 40 and 48
    #methods on lines 40 and 48 are called getters and setters 
      #ruby allows for special method syntax for setters, including = 
      #usual practice is to name the methods according to the instante method;
      #setters will always return the value passed as an argument
    puts bob.name
    bob.name = "Bobby"
    puts bob.name

    #attr_accessor :value is a way to create the getter and setter in one line, so they don't take as much space
      #attr_reader makes only a getter
      #attr_writer only makes a setter
      #syntax for multiple instance variables: attr_accesor :name, :height, :weight, etc
      #methods made with attr_accessor can then be called in a #{} as parts of other methods

    #calling accesor methods within another method has do be done with self.method, else ruby will think we are initializing a new variable
    bob.change_info("The Bobster", "24 inches", "45 lbs")
    bob.info

#MODULES
  # can be used to achieve polymorphism 
  # a module is a collection of behaviors that is usable in other classes via mixins
  # mixins = invocing the module on a class with the 'include' method
  # after the mixin, behaviors declared in that module are available to the class and its objects
  module Speak 
    def speak(sound)
      puts sound
    end
  end 
  
  class GoodDog
    include Speak
  end

  class Robot 
    include Speak 
  end
  eve = Robot.new

  sparky.speak("Woof!")
  eve.speak("Beep-boop!") # both classes include the same module

#CLASS METHODS
  # can be called directly on the class itself
  # defined with self. at the start 
  class NiceCat 
    @@number_of_cats = 0

    def initialize(name)
      @name = name
      @@number_of_cats += 1
    end

    def self.total_number_of_cats 
      puts @@number_of_cats
    end

    def self.what_am_i
      puts "I'm a NiceCat class!"
    end

    def to_s 
      "My name is #{@name} and I am a cat!"
    end
  end
  NiceCat.what_am_i

#CLASS VARIABLES
  #created using @@
  #useful for tracking class-specific data, that isn't relevant to individual objects of that class
  cat1 = NiceCat.new("Nala")
  cat2 = NiceCat.new("Chaos")
  puts NiceCat.total_number_of_cats

#TO_S method 
  #gets called automatically with puts and returns the id of the object in various instances, including OOP
  #can be overriden by a custom to_s method included in the class
  #must always return a string
  puts cat1 #displays <NiceCat:0x00007f1605d97340> without the custom to_s


#PRACTICE SPACE
  class MyCar 
    def initialize(y, c,m)
      @year = y
      @color = c 
      @model = m 
      @speed = 0
    end

    attr_accessor :color, :speed
    attr_reader :year, :model

    def speed_up
      self.speed += 10
      p "Sped up. Current speed is #{speed} km/h."
    end

    def brake 
      self.speed -= 10
      p "Used brake. Current speed is #{speed} km/h."
    end

    def stop
      self.speed = 0
      p "Car is turned off. Curent speed is #{speed} km/h."
    end

    def get_info
      puts "The car was made in the year #{year}, its' color is #{color} and its' model is #{model}."
    end

    def spray_paint=(c)
      self.color = c 
    end

    def self.gas_mileage(miles, fuel_consumed)
      puts "#{miles/fuel_consumed} miles per gallon of gas."
    end

    def to_s 
      "My car is a #{model} made in #{year}. Its' color is #{color}."
    end
  end

  car = MyCar.new(2012, "red", "Renault Megane")
  car.get_info 
  car.speed_up
  car.speed_up
  car.brake
  car.speed_up
  car.stop
  car.color="blue"
  car.get_info
  car.spray_paint="black"
  car.get_info
  MyCar.gas_mileage(100, 7)
  puts car