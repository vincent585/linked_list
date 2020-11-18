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

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def at(index)
    return 'Invalid index' unless index.is_a?(Integer)
    return 'nil' if index > size - 1

    current_node = head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return 'nil' if size.zero?

    @tail = size > 1 ? at(size - 2) : @head
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value)
    reps = size - 1
    current_node = head
    reps.times do
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end
end

list = LinkedList.new
list.append(42)
list.append(100)
list.prepend(12)
p list.contains?(12)
p list.contains?(69)
