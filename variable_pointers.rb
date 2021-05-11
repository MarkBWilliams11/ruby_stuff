p 'Variables as pointers'

#
# Variables are pointers to physical space in memory.or labels to refer to
# some physical memory address in computer
a = 'hi there'
b = a
a = 'not here'
p b #=> "hi there"

a = 'hi there'
b = a
a << ', Bob' #=> mutated caller with shovel <<
p b #=> "hi there, Bob"

# NOTE: mutating caller effects arrays and hashes aswell
def test(b)
  b.map { |letter| "I like the letter: #{letter}" }
end

a = %w[a b c]
p test(a)
# NOTE: using bang opertator(depending on the condition) may or may not mutate caller
