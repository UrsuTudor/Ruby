require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([5, 6, 2, 3, 1, 4])
tree.insert(2)
tree.pretty_print
