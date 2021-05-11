#permutation
=begin 
Is an array class method which returs all permutations of length n of the element
array, then returns the array itself.
=end
p [1,2,3].permutation(3).to_a
#Note: cant exceed the amount with integer [1,2,3].permutation(5) returns []