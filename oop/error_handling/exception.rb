# http://ruby.bastardsbook.com/chapters/exception-handling/
# ctrl + C if program wont quit infinite loop or something
a = 10
b = '79'

begin
  a + bS
rescue StandardError
  puts "could not add variables a (#{a.class} and b (#{b.class}))"
else
  puts " a + b #{a + b}"
end
#=> could not add variables a (Integer and b (String))
# Note: ruby did not crash

# with more data show different types
values = [42, 'a', 'r', 9, 5, 10_022, 8.7, 'sharon', 'Libya', 'Mars', '12', 98, rand + rand, { dog: 'cat' }, 100, nil,
          200.0000, Object, 680, 3.14, 'Steve', 78, 'Argo'].shuffle
while values.length > 0
  a = values.pop
  b = values.pop
  begin
    a + b
  rescue StandardError
    puts "could not add variables a (#{a.class} and b (#{b.class}))"
  else
    puts "a + b is #{a + b}"
  end
end

# infinite loop already here crtll +c to stop
# we are going to use the Kernel.gets method

# while 1
#   puts "Enter number: "
#   num = Kernel.gets.match(/\d+/)[0]
#   puts "#{num} + 1 is #{num+1}"
# end
# =
# while 1
#   puts "Enter number: "
#   num = Kernel.gets.match(/\d+/)[0]
#   puts "#{num} + 1 is #{num.to_i+1}" #=> to integer
# end

# To avoid ruby crash if input is nothing
# the follwoing alteration will convert any non-numerical input to zero

#
# while 1
#   puts "Enter number: "
#   num = Kernel.gets.to_i.to_s.match(/\d+/)[0]
#   puts "#{num} + 1 is #{num.to_i+1}" #=> to integer
# end
#

# Best to acknowledge the error to the user
#
# while 1
#   puts "Enter a number>>"
#   begin
#     num = Kernel.gets.match(/\d+/)[0]
#   rescue
#     puts "Erroneous input! Try again..."
#   else
#     puts "#{num} + 1 is: #{num.to_i+1}"
#   end
# end
# How Expetation handling is done in practice for unpredictable runtime problems

#=>more of what we are looking for so ruby does not crash
while 1
  puts 'Enter a number>>'
  if num = Kernel.gets.match(/\d+/)
    num = num[0]
    puts "#{num} + 1 is: #{num.to_i + 1}"
  else
    puts 'Erroneous input! Try again...'
  end
end
