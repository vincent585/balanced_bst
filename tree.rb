require_relative 'node'

class Tree
  attr_accessor :root
  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return if arr.empty?

    cleaned_arr = arr.sort.uniq
    return Node.new(cleaned_arr[0]) if cleaned_arr.length <= 1

    mid = cleaned_arr.length / 2
    root = Node.new(cleaned_arr[mid])
    root.left = build_tree(cleaned_arr[0...mid])
    root.right = build_tree(cleaned_arr[mid + 1..-1])
    root
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?
    return node if node.data == value

    node.data < value ? node.right = insert(value, node.right) : node.left = insert(value, node.left)
    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      if node.left.nil?
        temp = node.right
        return temp
      elsif node.right.nil?
        temp = node.left
        return temp
      end
      temp = min_value_node(node.right)
      node.data = temp.data
      node.right = delete(temp.data, node.right)
    end
    node
  end

  def min_value_node(node)
    current = node
    current = current.left while current.left
    current
  end

  def find(value, node = @root)
    return node if node.nil? || node.data == value

    node.data < value ? find(value, node.right) : find(value, node.left)
  end

  def level_order(node = @root)
    return if node.nil?

    result = []
    discovered_nodes = []
    discovered_nodes.push(node)
    until discovered_nodes.empty?
      current = discovered_nodes.shift
      result << current.data
      discovered_nodes << current.left unless current.left.nil?
      discovered_nodes << current.right unless current.right.nil?
    end
    result
  end

  def level_order_recursive(node = @root)
    return if node.nil?

    # TODO
  end

  def preorder(node = @root, result = [])
    return if node.nil?

    result << node.data
    preorder(node.left, result)
    preorder(node.right, result)
    result
  end

  def inorder

  end

  def postorder

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
bst.pretty_print
bst.insert(10)
bst.pretty_print
bst.insert(0)
bst.pretty_print
bst.insert(100)
bst.pretty_print
bst.delete(0)
bst.pretty_print
bst.delete(4)
bst.pretty_print
p bst.find(7).to_s
p bst.find(324).to_s
p bst.level_order
p bst.preorder
