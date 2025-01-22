require_relative "hash_map"

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('apple', 'black')
test.set('banana', 'black')
test.set('carrot', 'black')

# test.display_buckets
# puts "Size is #{test.length}"
# puts "Capacity is #{test.capacity}"
# p test.keys


puts "------------"
test.set('moon', 'silver')

test.set('dog', 'black')
test.set('apple', 'black')
test.set('banana', 'black')

# test.display_buckets
puts "Size is #{test.length}"
puts "Capacity is #{test.capacity}"
# p test.keys

# puts test.has?("moon")
# puts test.has?("kite")

# puts test.has?("akshion")
# puts test.has?("jooooohn")

# puts "Size is #{test.length}"
# puts "Capacity is #{test.capacity}"

# puts test.has?("moon")


# ll = LinkedList.new
# ll.append("a", "1")
# ll.append("b", "2")
# ll.append("c", "3")
# ll.append("d", "4")
# puts ll

# p ll.find("1")
# ll.remove_at(0)
# puts ll

# p test.get("apple")
# p test.get("moon")
# 

# p test.entries
# test.remove("moon")
# p test.entries
