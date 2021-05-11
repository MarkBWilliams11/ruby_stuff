# Exception Handling
#
# The process that deals with errors in a managabnle and predictble way
# ruby havve exception classes to handle erros easier. using the reserved
# words begin, rescue, and end to signify exception handling
# exception_example.rb

begin
  # perform some dangerous operation
rescue StandardError
  # do this if operation fails
  # for example, log the error
end

# We do this for unpredicitable outcomes wew need errors to let us know
# examnple see what happens when nil is returned

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  puts "#{name}'s name has #{name.length} letters in it."
rescue StandardError
  puts 'Something went wrong!' #=> if we result in errors
end

# Another example wthis time in-inline

zero = 0
puts 'Before each call'
begin
  zero.each do |element|
    puts element
  end
rescue StandardError
  puts "Can't do that!"
end
puts 'After each call'
