#
# not all errors are the same, and so when desiging your exception handling blocks.
# may find it necessary to write rescue statments
#
# Every type of error and exception is derivied drom the Exception class
#
# if our code rescues a StandardError, it will only rescue errors that are
#   derived from StandardError
#
# if our code rescues an Exception, it will basically handle every possible error
#   that could happen, including all errors of StandardError type and its childern tyes

while 1
  puts 'Enter a number>>'
  begin
    num = Kernel.gets.match(/\d+/)[0]
  rescue StandardError => e
    puts 'Erroneous input!'
    puts e
    puts "\tTry again...\n"
  else
    puts "#{num} + 1 is: #{num.to_i + 1}"
  end
end
