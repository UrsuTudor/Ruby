require_relative 'lib/tree'
require_relative 'lib/node'

test = Tree.new(Array.new(15) { rand(1..100) })
puts 'Initial tree:'
test.pretty_print

puts "\n#balanced? returns: '#{test.balanced?}'."

puts "\n----------PREORDER----------"
test.preorder { |node| print "#{node} " }
puts "\n\n----------INORDER----------"
test.inorder { |node| print "#{node} " }
puts "\n\n----------POSTORDER----------"
test.postorder { |node| print "#{node} " }
puts ''

test.insert(123)
test.insert(1534)
test.insert(1234)
test.insert(653)
test.insert(542)
test.insert(876)
test.insert(957)
test.insert(124)

puts "\nTree after inserting elements > 100:"
test.pretty_print
puts "\n#balanced? returns: '#{test.balanced?}' after insertion."

test.rebalance
puts "\n Tree after #rebalance."
test.pretty_print
puts "\n#balanced? returns: '#{test.balanced?}' after rebalance."

puts "\n----------PREORDER----------"
test.preorder { |node| print "#{node} " }
puts "\n\n----------INORDER----------"
test.inorder { |node| print "#{node} " }
puts "\n\n----------POSTORDER----------"
test.postorder { |node| print "#{node} " }
puts ''
