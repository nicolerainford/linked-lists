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
      @size += 1
      return
    end

    if index == 0
     return prepend(value)
    end

    if index == @size
      return append(value)
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


   end


    def remove_at(index)

     #need to stop at 1 before index skip one then go to one after index so i can do prev.next_node = after_index
      if index < 0 || index >= @size
        raise IndexError, "Index out of bounds"
      end

      if index == 0
        @head = @head.next_node
        @size -= 1
        @tail = nil if @size == 0
        return
      end

      current = @head
      count = 0
      while count < index - 1
        current = current.next_node
        count += 1
      end

      node_to_remove = current.next_node
      current.next_node = node_to_remove.next_node
      @tail = current if node_to_remove == @tail
      @size -= 1
    end


end

=begin
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
=end


test = LinkedList.new
test.append(10)
p test.contains?(10)
test.prepend(5)
test.append(20)
p test.find(20)

p test.to_s
test.insert_at(0,0)
p test.to_s
test.remove_at(2)
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
