require_relative 'node'

class LinkedList
  attr_accessor :name, :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    @head.nil? ? @head = new_node : @tail.next_node = new_node
    @tail = new_node
    @size += 1
  end
end

