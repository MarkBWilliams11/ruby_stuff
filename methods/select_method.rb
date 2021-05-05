#select Method
#here we are only returning the truthy vaules
p [1,2,3].select{|val|val.even?} #=> [2]
p [1,2,3].select{|val|val.odd?} #=> [1,3]

p " using select with reduce"
=begin 
a.push - first we push an elemtn onto list

if funcation.call - only if the function passed returns true 

  So the body of the function would be a new element is added to the new list
  if the function returned true when applied to the value. and a defualt value 
    for the accumulator
=end

def select(list, &function)
  list.reduce([]) { |acc, val|
    acc.push(val) if function.call(val)
    acc #return acc as evaluated and aviods nil return
  }
end
p select([1,2,3]) {|val| val.even?} #=>[2]

=begin 
1. we start with an empty list and push number one into it only if its even.
  is odd so we dont the list is empty

2. start with empty list and push number two if true
  now our list has two on it because it true two is even

3.start with a list containing two in it, push three if is even
  it not so list remain with number two

4.not left to evaluate so returns the list containing two
=end

#how should we implement selcet and select with reduce
=begin 

To select is to use a function to decide which element belong in a new list

To select with reduce is to use a function to decide whether or not to add an element 
to the new list

=end