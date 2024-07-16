class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

node1 = Node.new(10)
puts node1.value
puts node1.next_node
node2 = Node.new(20)
node1.next_node = node2
puts node1.next_node.value

#things to research
#getter vs setter and use cases - think banking
