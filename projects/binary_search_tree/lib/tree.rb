require 'pry-byebug'
require_relative 'node'

class Tree
  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  protected

  attr_accessor :root
end
