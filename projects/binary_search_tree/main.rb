require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([5, 6, 4, 3, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18])
tree.pretty_print
p tree.rebalance
