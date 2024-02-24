require_relative 'dll'

class Cache
  attr_accessor :capacity, :lookup_table, :dll

  def self.instance(capacity)
    @@cache ||= new(capacity)
  end

  def get(key)
    if lookup_table.has_key? key
      node = lookup_table[key]
      dll.update_lru_order(node)
      puts key
      puts node.val
      node.val
    else
      puts "Key is not present"
    end
  end

  def set(key, value)
    if lookup_table[key]
      node = lookup_table[key]
      node.val = value
      dll.update_lru_order(node)
    else
      node = dll.add_node(value)
      lookup_table[key] = node
    end
    puts node.val
  end

  def remove(key)
    if lookup_table[key]
      node = lookup_table[key]
      dll.remove_node(node)
      lookup_table.delete(key)
    else
      puts "Key is not present"
    end
  end

  private

  def initialize(capacity)
    @capacity = capacity
    @lookup_table = {}
    @dll = Dll.new
  end
end