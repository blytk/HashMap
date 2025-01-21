# Project HashMap
# Use the following snippet whenever you access a bucket through an index. We want to raise an error if we try to access an out-of-bounds index:
#   raise IndexError if index.negative? || index >= @buckets.length
#   



class HashMap
    attr_accessor :capacity, :load_factor
    attr_reader :number_of_keys

    def initialize(capacity = 16, load_factor = 0.75)
        @capacity = capacity
        @load_factor = load_factor
        @hash_array = Array.new(capacity) {LinkedList.new}
        @number_of_keys = 0
    end

    #1. #hash(key) takes a key and produces a hash code with it.
    def hash(key)
        hash_code = 0
        prime_number = 31

        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

        hash_code
    end

    #2. #set(key, value) takes two arguments; key and value assigned to this key. If a key already exists, then the old value is overwritten
    def set(key, value)
        # hash the key to find the index
        hash_index = hash(key)

        # traverse the linked list on the bucket (index should point to the head)
        cursor = hash_array[hash_index]

        # out of bounds error
        raise IndexError if hash_index.negative? || hash_index >= @capacity

        # linked_list is empty? cursor should point at the linked_list ojbect (empty)
        if cursor.head == nil
          new_node = Node.new(key, value)
          cursor.head = new_node
          @number_of_keys += 1
          return new_node
        end

        # linked_list is not empty
        while cursor != nil
            if cursor.key == key
                # found key, update its value
                cursor.value = value
                return [key, value]
            end
            cursor = cursor.next_node
        end
        # key is not present in the hashmap, cursor is pointing to tail
        # create Node (key, value, next_node = nil by default)
        new_node = Node.new(key, value)
        cursor.next_node = new_node
        @number_of_keys += 1
        new_node
        # check if buckets need to grow
        # ########
        # ######################
        # ########
    end
    #* traverse(key) / traverse linked list, return cursor if key is found (pointing at node with desired key) / nil otherwise
    def traverse(key)
      hash_index = hash(key)

      cursor = hash_array[hash_index]

      # out of bounds error
      raise IndexError if hash_index.negative? || hash_index >= @capacity

      if cursor.head == nil
        return nil
      else
        while cursor != nil
            if cursor.key == key
              return cursor
            end
          cursor = cursor.next_node
        end
      end
      return nil
    end

    #3. takes key argument, returns value assigned to key or nil if not found
    def get(key)
        # traverse list
        traverse_result = traverse(key)
        if traverse_result == nil
            return nil
        else
            traverse_result.value
        end
    end

    #4. #has?(key) takes a key as argument and returns true or false based on key present on hash map
    def has?(key)
      if get(key) == nil
        false
      else
        true
      end
    end

    #5. remove(key) takes a key as argument, if key is in hash map, remove entry with that key and return deleted node's value / nil
    def remove(key)
      traverse_result = traverse(key)
      if traverse_result == nil
        return nil
      else
        # store value to return later
        node_value = traverse_result.value
        # access LL object.remove_node_at(index_where_node_value_is)
        @number_of_keys -= 1
        hash_array[hash(key)].remove_at(find(node_value))
      end
    end

    #6. #length returns the number of stored keys in the hash map
    def length
      return @number_of_keys
    end

    #7. #clear removes all entries in the hash map
    
    def clear
        # In Ruby there is garbage collection, so I don't need to worry about freeing nodes / lists
        # access each linked_list and point the head towards nil / indexes 0-@capacity
        for i in 0...@capacity
        hash_array[i].head = nil
        end
        # reset number of keys
        @number_of_keys = 0
    end

    #8. #keys returns an array containing all the keys (I will do it on the fly, not in instance variables)
    def keys
      keys_array = []
      for i in 0...@capacity
        if hash_array[i].head != nil
          cursor = hash_array[i].head
          while cursor != nil
            keys_array << cursor.key
            cursor = cursor.next_node
          end
        end
      end
      keys_array
    end

    #9. #values returns an array containing all the values
    def values
      values_array = []
      for i in 0...@capacity
        if hash_array[i].head != nil
          cursor = hash_array[i].head
          while cursor != nil
            values_array << cursor.value
            cursor = cursor.next_node
          end
        end
      end
      values_array
    end

    #10. #entries returns an array that contains each key, value pair
    def entries
      entries_array = []
      for i in 0...@capacity
        if hash_array[i].head != nil
          cursor = hash_array[i].head
          while cursor != nil
            new_entry = [cursor.key, cursor.value]
            entries_array << new_entry
          end
        end
      end
      entries_array
    end
    
end

