# reduce method
p [1, 2, 3].reduce(0) { |acc, val| acc + val } #=> 6
#
# Here we are using the reduce method to get the sum of the given array[1,2,3]
# the the reduce method is given an initial value of zero . we start with an
# accumulator. the accumulator starts as the first argument to reduce, seeing
# that we used zero anything we should get back here is a number 0.
#
# val will be the actual values iterated over from the array being reduced
#
# then we join "+" (Note:if  * was used => 0 cause reduce initial value is zero)
# what it looks like:
# a => v => new
# 0 + 1 => 1
# 1 + 2 => 3
# 3 + 3 => 6
#
# Reduce is a way to take a list of many things and reduce it into one thing
# using an intial value, and a way to join values together to make a new
# accumulator
#
