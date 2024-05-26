require 'pry-byebug'
require_relative 'node'

class Tree
  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  protected

  attr_accessor :root

  def build_tree(arr = self.sorted_arr)
    return nil if arr.empty?

    mid = arr.length / 2
    self.root = Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
