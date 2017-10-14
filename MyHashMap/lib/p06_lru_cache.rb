#There is probably a problem with update! which is not moving
#node to end of list 
require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'
class LRUCache
  attr_reader :count
  def initialize(max, prc)
    if prc.nil?
      prc = Proc.new { |x| x**2 }
    end
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if !@map.include?(key)
      calc!(key)
      if @map.count > @max
        eject!
      end
    # else
    #   update_node!(@map[key])
    end

    # byebug
    @map[key].val

    # unless @map.include?(key)
    #   calc!(key)
    #   # @prc.call(key)
    # end
    # @map.get(key)
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @store.append(key, @prc.call(key))
    @map.set(key, @store.last)
    # byebug
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    @store.remove(node.key)
    @store.append(node.key, @prc.call(node.key))

  end

  def eject!

    lru = @store.first.key
    @map.delete(lru)
    @store.remove(lru)
  end
end
p "hi"
# if $PROGRAM_NAME == __FILE__
lru = LRUCache.new(3, nil)
lru.get(1)
lru.get(2)
lru.get(1)
debugger
# end
