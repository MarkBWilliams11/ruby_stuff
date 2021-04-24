#output commands
print "Using print" #=> does not return newline
puts"Using puts"    #=> returns a new line
x ="using a vairble with puts"
puts x
=begin 
Note: puts appends a new line to an argument passed in 
print keeps things on one line

very important thing to note for both commands is that after
printing whatever argument they are passed, puts and print both 
return nil.
=end

=begin
a rarely used ruby syntax used : in short another example 
allow ruby to run mutilple lines of ruby code on one line
generally not recommened "golf code"
=end
print "Hello World"; print "I love drinking coffee"

puts "Hello World"; puts "I love drinking coffee"

#inputs
=begin 
to accpect input froma a user, we cannuse the gets command. when we use 
gets, program execution will stop ans wait for user input.
after user presses ente, the program will continue
=end
gets
#will actually return the input typed
# so we can assign it a variable

#chop method used to trim the sperator
puts "Enter string: "
 new_string = gets.chomp

 puts new_string

#putc cann output one single character at a time
str="Hiya, doin"
puts str

# p good debugging tool return eveything object passed to it(raw version)
#good way to get an acurate value return
p"this is ruby" #=> will acutally print everything
p [1,2,3]
p "Hello there!\n"