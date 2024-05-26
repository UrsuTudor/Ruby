class Node
  include Comparable

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  attr_reader :data
  attr_accessor :left, :right

  def <=>(other)
    data <=> other.data
  end
end
