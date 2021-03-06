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

  def find(value)
    current_node = head
    i = 0
    while i < size
      return i if current_node.value == value

      current_node = current_node.next_node
      i += 1
    end
    'nil'
  end

  def to_s
    list_str = ''
    current_node = head
    i = 0
    while i < size
      list_str << "( #{current_node.value} ) -> "
      list_str << 'nil' if current_node.next_node.nil?
      current_node = current_node.next_node
      i += 1
    end
    list_str
  end

  def insert_at(value, index)
    return 'nil' if index.negative? || index > size

    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value, at(index))
      at(index - 1).next_node = new_node
      @size += 1
    end
  end

  def remove_at(index)
    return 'nil' unless index.between?(0, size - 1)

    if index.zero?
      @head = @head.next_node
      @size -= 1
    elsif at(index) == @tail
      pop
    else
      at(index - 1).next_node = at(index + 1)
      @size -= 1
    end
  end
end

list = LinkedList.new
list.append(42)
list.append(100)
list.prepend(12)
p list.contains?(12)
p list.contains?(69)
p list.find(12)
p list.find(100)
p list.find(42)
p list.find(33)
p list.to_s
list.insert_at(16, 1)
p list.to_s
list.remove_at(0)
p list.to_s
