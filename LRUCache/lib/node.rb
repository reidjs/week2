class Node
  attr_accessor :val, :next, :prev
  def initialize(val, parent_node = nil)
    @val = val
    if parent_node.nil?
      @prev = nil
      @next = nil
    else
      insert_after(parent_node)
    end
  end
  def insert_after(parent_node)
    @prev = parent_node
    @next = parent_node.next
    parent_node.next = self

  end
end
