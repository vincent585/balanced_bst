require_relative 'node'

class Tree
  def initialize(arr)
    @arr = arr
    @root = build_tree
  end
end
