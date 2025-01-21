# LinkedList class will represent the full list
class LinkedList
  # LinkedList needs a head and a tail, might be useful to keep track of them all the time? Just start with the head, as the tail is supposed to be a node with value
  attr_accessor :head

  def initialize
      @head = nil
  end

  # append
  def append(value)
      # create node
      new_node = Node.new(key, value, nil) # points to nil by default, but set it so it's clearer
      # find the tail
      # while current_node.next_node not nil
      if @head != nil
          cursor = @head
          while cursor.next_node != nil
              cursor = cursor.next_node
          end
          # at this point, cursor should be the tail???
          # We point the last node to the new node
          # In Ruby, variables hold references to objects, not the objects themselves. 
          # When you assign one variable to another, you're copying the reference, not the object. Meaning, if I change cursor, I change the object (as both variables hold the same reference to the same object)
          cursor.next_node = new_node
          # at this point, the last node should be already be pointing to the new_node and the new should be pointing to nil
      else
          @head = new_node
      end
  end

  # prepend
  def prepend(key, value)
      new_node = Node.new(key, value)
      if @head != nil
          cursor = @head
          @head = new_node
          new_node.next_node = cursor
      else
          @head = new_node
      end
  end

  #size
  def size
      size = 0
      if @head == nil
          0
      else
          cursor = head
          size = 1
          while cursor.next_node != nil
              cursor = cursor.next_node
              size += 1
          end
      end
      return size
  end

  #head 
  def head
      @head
  end

  #tail
  def tail
      if @head != nil
          cursor = head
          while cursor.next_node != nil
              cursor = cursor.next_node
          end
          cursor
      else
          nil
      end
  end

  #at(index)
  def at(index)
      if @head != nil
          cursor = head
          current_index = 1
          while cursor != nil
              if current_index == index
                  return cursor
              else
                  cursor = cursor.next_node
                  current_index = current_index + 1
              end
          end
      else
          return nil
      end
  end

  #pop
  def pop
      if @head != nil
          cursor = @head
          tail = nil
          while cursor.next_node.next_node != nil
              cursor = cursor.next_node
          end
          tail = cursor.next_node
          cursor.next_node = nil
          return tail
      else
         return nil
      end
  end

  #contains?(value)
  def contains?(value)
      if @head != nil
          cursor = @head
          p cursor.next_node
          while cursor.next_node != nil
              if cursor.value == value
                  return true
              end
              cursor = cursor.next_node
          end
          return false
      else
          return false
      end
  end

  #find(value)
  def find(value)
      if @head != nil
          cursor = @head
          index = 1
          while cursor != nil
              if cursor.value == value
                  return index
              end
              cursor = cursor.next_node
              index += 1
          end
          nil
      else
          nil
      end
  end

  #to_s / (key: value) -> (key: value) -> key: (value) -> nil
  def to_s
      if @head != nil
          cursor = @head
          string = ""
          while cursor != nil
              string = string + "(#{cursor.key}: #{cursor.value}) -> "
              cursor = cursor.next_node
          end
          string = string + "nil"
      else
          nil
      end
  end

  #insert_at(value, index)
  def insert_at(key, value, index)
      if @head != nil
          # create new node
          new_node = Node.new(key, value)
          # traverse the list
          cursor = @head
          cursor_index = 0

          if index == 0            
              tmp = @head
              @head = new_node
              new_node.next_node = tmp
          else
              while cursor != nil
                  if cursor_index + 1 == index
                      tmp = cursor.next_node
                      cursor.next_node = new_node
                      new_node.next_node = tmp
                  end
                  cursor = cursor.next_node
                  cursor_index += 1
              end
              new_node         
          end
      else
          nil
      end
  end

  #remove_at(index)
  def remove_at(index)
      if @head != nil
          cursor = @head
          cursor_index = 0

          if index == 0
              @head = @head.next_node
              return cursor
          else
              while cursor != nil
                  if cursor_index + 1 == index
                      tmp = cursor.next_node
                      cursor.next_node = cursor.next_node.next_node
                      return tmp
                  end
                  cursor = cursor.next_node
                  cursor_index += 1
                  if cursor.next_node == nil
                      return nil
                  end
              end
          end
      else
          nil
      end
  end
end