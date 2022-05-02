class Tree
  # remove duplicates when initializing
  attr_reader :root
  @root

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.node}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def initialize(arr)
    @arr = arr.uniq.sort!
  end

  def build_tree(arr = @arr)
    if arr.empty?
      nil
    else
      mid = (arr.length - 1) / 2
      root = Node.new(arr[mid])
      root.left = build_tree(arr[0...mid])
      root.right = build_tree(arr[mid+1..arr.length])
      @root = root
    end
  end

  def insert(value, tree = @root)
    if tree.nil?
      Node.new(value)
    else
      if value < tree.node
        tree.left = insert(value, tree.left)
      else
        tree.right = insert(value, tree.right)
      end
    tree
    end
  end

  def min_value_node(node)
    current = node
    until current.left.nil?
      current = current.left
    end
    current
  end

  def delete(value, tree = @root)
    if tree.nil?
      nil
    else
      if value < tree.node
        tree.left = delete(value, tree.left)
      elsif value > tree.node
        tree.right = delete(value, tree.right)
      else 
        if tree.left.nil?
          temp = tree.right
          tree = nil
          return temp
        elsif tree.right.nil?
          temp = tree.left
          tree = nil
          return temp
        end
          temp = min_value_node(tree.right)
          tree.node = temp.node
          tree.right = delete(temp.node, tree.right)
      end
      return tree
    end
  end

  def find(value, tree = @root)
    #base case
    if tree.nil? || tree.node == value
      tree unless tree.node.nil?
    else
      if value < tree.node 
        find(value, tree.left)
      else
        find(value, tree.right)
      end
    end
  end

  def level_order(tree = @root, queue = [])
    return to_enum(:level_order) unless block_given?
    return if tree.nil?
    queue.push(tree)
    until(queue.empty?)
      current = queue.shift
      yield(current.node)
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
    end
  end

  def preorder(tree = @root)
    return if tree.nil?
    p(tree.node)
    preorder(tree.left)
    preorder(tree.right)
  end

  def inorder(tree = @root)
    return if tree.nil?
    inorder(tree.left)
    p tree.node
    inorder(tree.right)
  end

  def postorder(tree = @root)
    return if tree.nil?
    postorder(tree.left)
    postorder(tree.right)
    p tree.node
  end

  def height(tree = @root)
    return -1 if tree.nil?
    left_height = height(tree.left)
    right_height = height(tree.right)
    [left_height, right_height].max + 1
  end

  def depth(node, tree = @root)
    
  end

  def balanced?(tree = @root)
    left = height(tree.left)
    right = height(tree.right)
    difference = left - right
    if([-1,0,1].include?(difference))
      true
    else
      false
    end
  end

  def rebalance(tree = @root, array = [])
    level_order do |node|
      array.push(node)
    end
    build_tree(array)
  end
end
