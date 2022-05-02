class Node
  attr_accessor :left, :right, :node
  def initialize(node, left = nil, right = nil)
    @node = node
    @left = left
    @right = right
  end
end
