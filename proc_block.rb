# Procs and Blocks
# blocks
#
# block, like parameters, can be passed into a method just like normal variables
def take_block(&block)
  block.call
end

take_block do
  puts 'Block being called in the method!'
end
#
# The & in the method definition tellls us that the argument is a block. The block must always
# be the last parameter in the method definition.
#
# then we can call it like any other method take_block

# abit mroe complex
# passing_block.rb

def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end
#
# Here we are passing the number into the take block method and using it in our block.call.

p 'Udsing the proc method'
# procs
#
# proc are blocks that are wrapped ina proc object, and store in a variable to be passed around.

talk = proc do
  puts 'I am talking.'
end
talk.call

# procs can also take an arugment
talk = proc do |name|
  puts "I am talking to #{name}"
end
talk.call 'Bob'

# procs can be passed into methods
def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = proc do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)
#
# using proc gives us the flexability to be able to reuse blocks in more than one place without
# having to type them out everytime
