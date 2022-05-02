require_relative 'tree.rb'
require_relative 'node.rb'
# Creating a binary search tree from random array
random_array = (Array.new(15) { rand(1..100) })
puts " Binary tree created from: #{random_array}"
binary_tree = Tree.new(random_array)
binary_tree.build_tree
binary_tree.pretty_print

# Printing out the tree in different orders and checking if balanced
puts "Is the binary tree balanced?: #{binary_tree.balanced?}"
puts "Printing the elements in level order:"
binary_tree.level_order {|node| p node}
puts "Printing the elements in preorder:"
binary_tree.preorder
puts "Printing the elements in inorder:"
binary_tree.inorder
puts "Printing the elements in postorder:"
binary_tree.postorder

# Intentionally unbalancing the tree
puts "Insertion to unbalance the tree"
binary_tree.insert(7777)
binary_tree.insert(7778)
binary_tree.insert(7779)
binary_tree.pretty_print
puts "Is the current binary tree balanced?: #{binary_tree.balanced?}"

# Rebalancing the tree
puts "After balancing the binary tree: "
binary_tree.rebalance
binary_tree.pretty_print
puts "Is the current binary tree balanced?: #{binary_tree.balanced?}"
puts "Printing the elements in level order:"
binary_tree.level_order {|node| p node}
puts "Printing the elements in preorder:"
binary_tree.preorder
puts "Printing the elements in inorder:"
binary_tree.inorder
puts "Printing the elements in postorder:"
binary_tree.postorder