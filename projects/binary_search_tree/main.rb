require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([5, 6, 2, 3, 1, 4])
tree.delete(5)
p tree
tree.pretty_print
