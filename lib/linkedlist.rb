require_relative 'node'

class LinkedList
  attr_accessor :head, :size, :tail

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)

    if !@head
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
      @tail = new_node
    else
      temp = @head
      @head = new_node
      @head.next_node = temp
    end
    @size += 1
  end

  def at(index)
    count = 0
    current = @head
    while index > count
      current = current.next_node
      # puts current
      count += 1
    end
    current.value
  end

  def pop
    # handle case where list is empty or has 1 one node
    return nil if @size == 0

    if @size == 1
      popped_val = @tail.value
      @head = nil
      @tail = nil
    else
      current = @head
      current = current.next_node while current.next_node != @tail
      popped_val = @tail.value
      current.next_node = nil
      @tail = current
    end

    @size -= 1
  end

  def contains?(value)
    #iterate thru and look at values. if current.value matches input param return true
    return false if @head == nil
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    #return index of given value or nil if not found
    return nil if @head == nil
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
  end

  def to_s
    #( value ) -> ( value ) -> ( value ) -> nil
    current = @head
    while current
      print "(#{current.value}) -> "
      current = current.next_node
    end

  end

  def insert_at(value, index)
    new_node = Node.new(value)
    #handle index input error
    if index < 0 || index > @size
      raise IndexError, "Index out of bounds"
    end

    if !@head
      @head = new_node
      @head.next_node = nil
      return
    end

    if index == 0
      prepend(value)
      return
    end

    if index == @size
      append(value)
      return
    end

    current = @head
    count = 1
    while index > count
      current = current.next_node
      count += 1
    end
    #p current.value
    temp = current.next_node
    current.next_node = new_node
    new_node.next_node = temp
    @size += 1
    return
  end


end

list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.prepend(5)
puts list.size
p list.head.value
p list.tail.value
p 'break'
list.pop
p list.tail.value
p "b"

test = LinkedList.new
test.append(10)
p test.contains?(10)
test.prepend(5)
test.append(20)
p test.find(20)

p test.to_s
p test.insert_at(0,0)
p test.to_s

=begin

# node1 = Node.new(10)
# puts node1.value
# puts node1.next_node
# node2 = Node.new(20)
# node1.next_node = node2
# puts node1.next_node.value

# node3 = Node.new(30)
# puts node2.next_node
=end
