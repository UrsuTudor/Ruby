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
      def initialize(name)
        @name = name
      end

      def introduction
       "Hi, my name is #{@name}!"
      end
    end
    # @name is an instance variable that can be called from withing the class
      bob = Person.new("Bob") #sets @name to Bob for the bob variable
    # instance variables contain data that is individually scoped for each object 
      # you may have 10 CoffeMachine objects that each have an individual @water_level variable 

  #instance methods 
    # methods can be added much like instance varialbes, see above
      puts bob.introduction

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

 #LEFT OFF AT ACCESSOR METHODS ON LINE 46