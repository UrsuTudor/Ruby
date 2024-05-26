# simple node
class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
  attr_accessor :value, :next_node
end

# MAKING A HASH CODE
  # a good hash function will:
    # use the entire key to get the index
    # create as little collisions as possible
    # make the likelyhood of a index occuring equal for all indexes
  def string_to_number(string) # number will be used as index to bucket
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def hash(name, surname)
    string_to_number(name) + string_to_number(surname)
  end

  p hash('Irelia', 'Xan')

# BUCKETS
  # arrays
  # keys go into buckets depending on their number
    # number is index
    # example:
      # Fred into hash = 508
      # fred gets stored as Fred: Smith at bucket index 508

  # collisions will require the use of Linked Lists

# GROWTH
  # starting with a size of 16, do modulo 16 on the key number to see where to put it
  # capacity and load factor need to be tracked
  # when bucket list is getting close to its load factor, double its size
