

# Project HashMap
# Use the following snippet whenever you access a bucket through an index. We want to raise an error if we try to access an out-of-bounds index:
#   raise IndexError if index.negative? || index >= @buckets.length
#   
#1. #hash(key) takes a key and produces a hash code with it.
#2. #set(key, value) takes two arguments; key and value assigned to this key. If a key already exists, then the old value is overwritten
#   A collision is when two different keys sit inside the same bucket. Here, we link to the tail of the existing linked list in that index
class HashMap
    attr_accessor :capacity, :load_factor
    def initialize(capacity = 16, load_factor = 0.75)
        @capacity = capacity
        @load_factor = load_factor
    end

    def hash(key)
        hash_code = 0
        prime_number = 31

        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

        hash_code
    end

    def set(key, value)
        # check if key already exists in that index (hash)
    end


end

