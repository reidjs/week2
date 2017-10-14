class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next == @tail && @tail.prev == @head
    false
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    # current_node = first
    # until current_node == @tail
    #   return current_node.val if current_node.key == key
    #   current_node = current_node.next
    # end
    # each do |node|
    #   return node.val if node.key == key
    # end
    nil
  end

  def include?(key)
    current_node = first
    until current_node == @tail
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
    node.next = @tail
  end

  def update(key, val)
    current_node = first
    until current_node == @tail
      if current_node.key == key
        current_node.val = val
        break
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = first
    until current_node == @tail
      if current_node.key == key
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
        return true
      end
      current_node = current_node.next
    end
    return false
  end

  def each
    current_node = first
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
