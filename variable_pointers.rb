p "Variables as pointers"

=begin 
Variables are pointers to physical space in memory.or labels to refer to 
some physical memory address in computer
=end
a = "hi there"
b = a
a = "not here"
p b #=> "hi there"

a = "hi there"
b = a
a << ", Bob" #=> mutated caller with shovel <<
p b #=> "hi there, Bob"

#Note: mutating caller effects arrays and hashes aswell
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
p test(a)
#Note: using bang opertator(depending on the condition) may or may not mutate caller
