class Node
  attr_accessor :key, :value, :next_node
  def initialize(value = nil, key = nil, next_node = nil)
      @key = key
      @value = value
      @next_node = next_node
  end
end