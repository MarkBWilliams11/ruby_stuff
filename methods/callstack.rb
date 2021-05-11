# Callstack
#
# the call stack helps ruby keep track of what is executing as well
# as where the execution should resume when it returns
#
# much like stacking one book on top of another or remove
# the top most book from the stack
#
# the call stack puts information about the curren mthod
# on top of the call stack, then removes that information
# when it returns

def first
  puts 'first method'
end

def second
  first
  puts 'second method'
end

second
puts 'main method'

#
# when the program starts running we have one item called
# the stackframe that represents the global (top-level)
# portion of the program. the inital stackframe is sometimes
# call the main method. ruby uses this frame to keep track
# of what part of the main program it is currently working
# on
#
# Call Stack
# -
# -
# -
# main
#
# line 23 here is our main whhich ruby will reference it
# as the curennt location of where it should resume when seond is done running
#
# after setting the location in the current stackframe, ruby
# creates a new stack frame for the second method and pushes it
# onto the stack
#
# Call Stack
# -
# -
# second
# main: line 23
#
# while the second frame is still on the stack, main remains
# beneath it inaccessiable, st the same time the main method
# becomes dorman and the second method becomes active
#
# the second method calls the first method on on line 19.
# the action causesn ruby to update the second frame so the ruby
# will know where to resume execution later. it then creates a
# new  stack frame for the frist method and pushes it to the
# call stack
#
# Call Stack
# -
# first
# second: line 19
# main: line 23
#
# Once the first method begins executing it invokes the puts
# mehod. All ruby methods including the built-in ones like puts
# shre the same call stack. therefore, we need tio record our
# current location and then push a new frame to the stack
#
# Call Stack
# puts
# first: line 15
# second: line 19
# main: line 23
#
# When puts returns, ruby removes or pops the top frame from
# the callstack. for this example it puts, leaving this fram
# exposed. rubyuses this frame to determine where execution should
# resume.
#
# Call Stack
# -
# first: line 15
# second: line 19
# main: line 23
#
# The first method will return. then is is popped from the
# stack. from that pop it will tell ruby where is should
# resume next within the stack
#
# Call Stack
# -
# -
# second: line 19
# main: line 23
#
# when the second finishes executing, the stack frame for
#   second gets popped from the callstack exposing the frome for main
#   the main frame tells ruby where to execue next
#
#   Call Stack
# -
# -
# -
# main: line 23
#
# the main ahs no more code to run. main gets popped from stack
# and the program ends.
#
# Call Stack
# -
# -
# -
# -
#
