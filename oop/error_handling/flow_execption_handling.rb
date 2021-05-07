#
# Exception is a powerful mechanism in programing.And like all powerful features,the
# correct and incorrect use of it will have large effects on how reliable and maintainable
# our script is
#
# Amoung its hardest to grasp is the ability to break flow in program, even more
# so than standard if/else
#
# Using retry
#
# The retry statement redirects the program back to the begin statement. This helpful
#   if you beging/rescue is inside a loop and you want to retry the smae command and parameters
#     that previously resulted in failure
#
#     raise creates its own Exception

('A'..'C').each do |i|
  retries = 2
  begin
    puts "Executing command #{i}"
    raise 'Exception'
  rescue Exception => e
    puts "\tCaught:  #{e}"
    if retries > 0
      puts "\tTrying #{retries} more times\n"
      retries -= 1
      sleep 2
      retry
    end
  end
end
