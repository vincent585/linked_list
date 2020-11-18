class Node
  attr_accessor :next_node, :value
  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end
