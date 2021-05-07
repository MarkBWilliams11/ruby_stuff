#
# https://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-begin
# This is the most basci error handlding technique. start with the keyword
# begin and acts similar to a if statement  in that flows to another branch
# if an error is encountered
require 'open-uri'
require 'timeout'

remote_base_url = 'http://en.wikipedia.org/wiki'

start_year = 1900
end_year = 2000

(start_year..end_year).each do |yr|
  begin
    rpage = open("#{remote_base_url}/#{yr}")
  rescue StandardError => e
    puts "Error: #{e}"
  else
    rdata = rpage.read
  ensure
    puts 'sleeping'
    sleep 5
  end

  File.open("copy-of-#{yr}.html", 'w') { |f| f.write(rdata) } if rdata
end

#
# begin- This starts off exeception-handling block. put in operation that hasa a risk of failing
#     ex: open method will throw error if website is down
#
# rescue- This is the branch that executes if an exception or error is raised.
#   it includes code we want to execute in the event of error or exception
#   (note there is a difference in Exception and Error classes)
#
#   ruby's: StandardError=>e puts error statement using content e
#
#
# else- if all goes well, the program will branch here.
#   (the conetents of open here)
#
# ensure- This branch will execute whether an error/exception was rescued or not
#
