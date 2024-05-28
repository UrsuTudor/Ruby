require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([5, 6, 4, 3, 2, 1, 8, 10, 9, 7, 11, 12, 13, 14, 15, 16, 0])
tree.pretty_print
tree.postorder do |root|
  p root
end
