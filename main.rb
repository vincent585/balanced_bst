require_relative 'tree'
require_relative 'node'

bst = Tree.new(Array.new(15) { rand(1..100) })
bst.balanced?
bst.pretty_print
puts "Level order: #{bst.level_order}"
puts "Preorder: #{bst.preorder}"
puts "Postorder: #{bst.postorder}"
puts "Inorder: #{bst.inorder}"
10.times { bst.insert(rand(101..1000)) }
bst.pretty_print
p bst.balanced?
bst.rebalance
p bst.balanced?
bst.pretty_print
puts "Level order: #{bst.level_order}"
puts "Preorder: #{bst.preorder}"
puts "Postorder: #{bst.postorder}"
puts "Inorder: #{bst.inorder}"
