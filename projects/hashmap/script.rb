# frozen_string_literal: true

require 'pry-byebug'

# linked list and methods on it
class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    list.push(Node.new(value, list[0]))
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

    list[delete_index - 1].next_node = list[delete_index] if !delete_index.zero?

    list
  end

  def increment_next_node
    list.each_with_index do |node, node_index|
      node.next_node = list[node_index + 1]
    end
  end

  def each
    list_length = list.length
    index = 0
    until index == list_length
      yield(list[index])
      index += 1
    end
    self
  end

  def each_with_index
    list_length = list.length
    index = 0
    until index == list_length
      yield(list[index], index)
      index += 1
    end
    self
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

  def hash_key
    key = value.each_key { |key| return key}
  end

  def hash_value
    val = value.each { |key, value| return value}
  end

  def update_value(new_val)
    value.each_key do |key|
      self.value = { "#{key}": new_val }
    end
  end

  attr_accessor :value, :next_node
end

class HashMap
  def initialize
    @buckets = Array.new(16)
    @capacity = 16
    @load_factor = 0.75
  end

  attr_accessor :capacity, :buckets
  attr_reader :load_factor

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash_object = { "#{key}": value }
    index = hash(key) % capacity

    raise IndexError if index.negative? || index >= @buckets.length

    if buckets[index].nil?
      buckets[index] = LinkedList.new
      buckets[index].append(hash_object)
      return
    end

    # updates node if the key is a duplicate
    buckets[index].each do |node|
      if node.hash_key.to_s == key
        node.update_value(value)
        return
      end
    end

    # appends the new hash_objects if the two ifs above don't return
    buckets[index].append(hash_object)
    buckets[index].increment_next_node
  end

  def get(key)
    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each { |node| return node.hash_value if node.hash_key.to_s == key }
    end

    nil
  end

  def has?(key)
    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each { |node| return true if node.hash_key.to_s == key }
    end

    false
  end

  def remove(key)
    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each_with_index do |node, node_index|
        if node.hash_key.to_s == key
          bucket.delete_at(node_index)
          return node.hash_value
        end
      end
    end

    nil
  end

  def length
    length = 0
    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each { length += 1 }
    end

    length
  end

  def clear
    buckets.each_with_index do |bucket, index|
      next if bucket.nil?

      buckets[index] = nil
    end
    buckets
  end

  def keys
    keys = []

    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each { |node| keys.push(node.hash_key) }
    end

    keys
  end

  def values
    values = []

    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each { |node| values.push(node.hash_value) }
    end

    values
  end

  def entries
    entries = []

    buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |node|
        hash = [node.hash_key, node.hash_value]
        entries.push(hash)
      end
    end

    entries
  end
end
