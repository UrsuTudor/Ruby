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

  public

  def insert(val, root = self.root)
    return root = Node.new(val) if root.nil?
    return root if val == root.data

    if val > root.data
      root.right = insert(val, root.right)
    elsif val < root.data
      root.left = insert(val, root.left)
    end

    root
  end

  def delete(val, root = self.root)
    # handle cases in which left, right or both are nil
    return root.right if val == root.data && root.left.nil?
    return root.left if val == root.data && root.right.nil?

    # handle cases in which the root to be deleted has two children
    if val == root.data && !root.right.nil? && !root.left.nil?
      next_biggest = next_biggest(root.right)
      delete(next_biggest, root)

      next_biggest.left = root.left
      next_biggest.right = root.right
      return next_biggest
    end

    # the actual recursion
    if val > root.data
      root.right = delete(val, root.right)
    elsif val < root.data
      root.left = delete(val, root.left)
    end

    root
  end

  # helper method for delete
  def next_biggest(root)
    return root if root.left.nil?

    next_biggest(root.left)
  end

  def find(val, root = self.root)
    return root if val == root.data

    if val > root.data
      find(val, root.right)
    elsif val < root.data
      find(val, root.left)
    end
  end

  def level_order(root = self.root, queue = [], values_arr = [], &block)
    # dequeues the element that is currently being iterated over
    queue.shift

    # pushes children of node into queue
    queue.push(root.left) unless root.left.nil?
    queue.push(root.right) unless root.right.nil?

    if block_given?
      yield root.data
      # queue being empty means there were no more children to push
      return if queue.empty?
    else
      values_arr.push(root.data)
      return values_arr if queue.empty?
    end

    level_order(queue[0], queue, values_arr, &block)
  end

  def preorder(root = self.root, &block)
    return if root.nil?

    yield root.data
    preorder(root.left, &block)
    preorder(root.right, &block)
  end

  def inorder(root = self.root, &block)
    return if root.nil?

    inorder(root.left, &block)
    yield root.data
    inorder(root.right, &block)
  end

  def postorder(root = self.root, &block)
    return if root.nil?

    postorder(root.left, &block)
    postorder(root.right, &block)
    yield root.data
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
