#remove duplicates from unsorted linked list
#how would you solve if temporary buffer not allowed?

#what type of data?
#what is more important, space or time?
#maximum list size?

#nodes
#each node points to next node
#link operation
#remove operation

#after creating node structure, look for duplicates
#if duplicate found, remove from list

class Node
  attr_accessor :value, :parent, :child
  def initialize(value = nil)
    @value = value
  end

  def parent=(node)
    @parent = node
    node.child = self
  end

  def remove
    @parent.child = @child
    @child.parent = @parent
  end
end

def remove_dups(node)
  values = []
  while !node.nil?
    if values.include?(node.value)
      node.remove
    else
      values << node.value
    end
    node = node.child
  end
end

def remove_dups_recursive(node, values = [])
  if !node.nil?
    child = node.child
    values.include?(node.value) ? node.remove : values << node.value
    remove_dups_recursive(child, values)
  end
end


a = Node.new('a')
b = Node.new('b')
c = Node.new('a')
d = Node.new('d')
e = Node.new('e')
b.parent = a
c.parent = b
d.parent = c
e.parent = d
# p a.parent.value
p d.parent.value
remove_dups_recursive(a)
p d.parent.value
