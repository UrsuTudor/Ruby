require 'pry-byebug'

# linked list and methods on it
class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    list.push(Node.new(value))
  end

  def preppend(value)
    list.unshift(Node.new(value, list[0]))
  end

  def size
    list.length
  end

  def head
    list[0]
  end

  def tail
    list[-1]
  end

  def at(index)
    list[index]
  end

  def pop
    list.pop
  end

  def contains?(value)
    list.each do |node|
      return true if node.value == value
    end

    false
  end

  def find(value)
    list.each_with_index do |node, index|
      return index if node.value == value
    end

    nil
  end

  def to_s
    stringed = ''
    list.each do |node|
      stringed << "(#{node.value}) -> "
    end

    stringed << 'nil'
    stringed
  end

  def insert_at(value, insert_index)
    list.insert(insert_index, Node.new(value, list[insert_index]))

    list.each_with_index do |node, node_index|
      node.next_node = list[node_index + 1] if node_index < insert_index
    end

    list
  end

  def delete_at(delete_index)
    list.delete_at(delete_index)

    list[delete_index - 1].next_node = list[delete_index]

    list
  end

  private

  attr_accessor :list
end

# simple node
class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
  attr_accessor :value, :next_node
end
