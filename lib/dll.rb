require_relative 'dll_node'

class Dll
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add_node(val)
    if head
      node = DllNode.new(tail, head, val)
      tail.next_node = node
      self.tail = node
    else
      node = DllNode.new(nil, nil, val)
      self.head = node 
      self.tail = head
      node.prev_node = node
      node.next_node = head
    end
    node
  end

  def remove_node(node)
    prev_node = node.prev_node
    next_node = node.next_node
    if prev_node == nil
      self.head = next_node
    elsif next_node == nil
      self.tail = prev_node
    end
    prev_node.next_node = next_node if prev_node
    next_node.prev_node = prev_node if next_node
    node.prev_node = nil
    node.next_node = nil
  end
  
  def update_lru_order(node)
    remove_node(node)
    add_node(node.val)
  end
end
