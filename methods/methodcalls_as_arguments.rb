# Method calls as arguments

# method for addition
def add(a, b)
  a + b
end

# method for subtration
def subtract(a, b)
  a - b
end
# calling the methods
p add(20, 45) #=> 65
p subtract(80, 10) #=> 70

#
# Now we can pass the method call as an argument to other
# methods
def multiply(num1, num2)
  num1 * num2
end

p multiply(add(20, 45), subtract(80, 10)) #=>4550

# we can eve be more complex with we use this concept
p add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5))) #=> 560
