require 'csv'
require 'erb'

require 'google/apis/civicinfo_v2'
# https://github.com/googleapis/google-api-ruby-client

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#=> #<Google::Apis::CivicinfoV2::CivicInfoService:0x007faf2dd47108 ... >

civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
#=> "AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw"

# CSV comma seperated values
#
# file stores tabular data (number and text) in plain-text form. The CSV format
# is readable by a large number of applications

#
# read file contents
# lines = File.readlines('event_attendees.csv')
# lines.each_with_index do |line,index|
#   next if index == 0
#   columns= line.split(",")
#   name= columns[2]
# p name
# end
# we can see first line is header information
# id, regDate, firstname, lastname, email, homephone,street,city,state,zipcode
# wew are looking for first name
# need to convert string to an array of columns
# the serpertation of columns here uses ","
# column = line.split(",")
# after the array created the firstname resides in the columns[2] index
# header row is not needed so we should ignore it,
# using the next if line checks every line to see if it matches
# (note: this soulution could change in the future, columns added etc...)
# so we can use arrays index instead of data
#
# Ruby offers a CSV parser
def clean_zipcode(zipcode)
  if zipcode.nil? #=> for nil return for no entry of zipcode
    zipcode = '00000'
  elsif zipcode.length < 5
    zipcode = zipcode.rjust(5, '0')
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  else
    zipcode
  end
end
p nil.to_s #=>""
# or using th e to string method and combining other we can combine
def cleaner_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(_zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
    # legislators = legislators.officials
    # legislator_names = legislators.map(&:name)
    # legislators_string = legislator_names.join(", ")
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'Event initialized'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

# template_letter = File.read('form_letter.html')
template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = row[:zipcode]
  zipcode = cleaner_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)
  #  personal_letter = template_letter.gsub('FIRST_NAME', name)
  #   personal_letter.gsub!('LEGISLATORS', legislators)
  #   puts personal_letter
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)
end

# accessing columns by name with CVS parser using conversion to symbol
# zipcodes or any values in general that start 0 as integer
# in the database is recognize as zero and are removed
# pseudocode for clean zipcode
# if the zip code is exactly five digits, assume that it is ok
# if the zip code is more than five digits, truncate it to the first five digits
# if the zip code is less than five digits, add zeros to the front until it becomes five digits

# String#rjust - to pad the string with zeros. returns a string!

#
# The Civic information API allows registered individuals to obtain some informaion
# about the repesentatives for each level of governmant for and address
#
# for any us residential address you can look up who repreents that adress at
#   each elected level of government.During supported elections, you can also
#   look up polling places ealry vote location, candidate, and other election offical
#   information

# accessing API
#
# -https:// : Use the Secure HTTP protocol
# -www.googleapis.com/civicinfo/v2/ : The API server address on the internet
# -representatives : The method called on that server
# -? : Parameters to the method
#   -& : The parameter separator
#   -address=80203 : The zipcode we want to lookup
#   -levels=country : The level of government we want to select
#   -roles=legislatorUpperBody : Return the representatives from the Senate
#   -roles=legislatorLowerBody : Returns the representatives from the House
#   -key=AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw : A registered API Key to authenticate our requests
#
#
#   Collecting the names of the legislators
#
#   for each zipcode, iterate over the array of legislators.
#   for each legislator, we want to find the representative's name.
#   add the name to the new collection of names
#
#   we will do this using map
#     legislator_names = legislators.map do |legislator|
#     legislator.name
#   end
#
#   shorthand legislator = legislators.map(&:name)
#
#
#   Displayingg legislators to a method
#     does the code clearly express what it is trying to accomplish?
#     legislators_by_zipcode with one parameter for the zipcode
#     and retruns a comma seprated string of legislator names
#
#
#     Iteration form letters
#     coustom letter that thanks them for attending the confernence and
#     provides a list of their representatives
#
#     Ruby has a few ways that we can define strings. this form
#     %{String Contents} is one choice when defining a string that spans multi-lines
#     doing a blob of text would be much more difficult to understand, making it difficult
#     to change
#
#     Instead of including the template within our application we can load the
#     template using File tools
#     This case form_letter.html (made in root directory not lib folder)
#         later the file is moved to a new location and are more explicit
#         on defining the location of the template.
#
#
#    Replacing with gsub and gsub!
#     we want to replace the FRIST_NAMES and LEGISLATORS
#       -FRIST_NAME indiduals firstname
#       -LEGISLATORS representatives
#
#   two methods to replace text String#gsub and String#gsub!
#   gsub - retruns new copy of original with the values replaced
#   gsub! - will replce the values in the original string
#       we replace the first name in the template letter and return a new copy
#       personal_letter
#   #Our Template system has problems
#
#   ruby defines a template language named ERB
#
#   provides an easy to use but powerful template system for ruby.
#   <%= ruby code will execute and show output %>
# <% ruby code will execute but not show output %>
#
# We can defne our ERB escape tags within any string

#
# meaning_of_life = 42
#
# question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life %>"
# template = ERB.new question
#
# results = template.result(binding)
# puts results

#
# the code above laods ERB library(require"erb") then creates a new ERB template with the
# question string. the string contains ERB tags that will show the results of the variable
# meaning_of_life. We send the result message to the template with binding
#
# Binding- returns a special object. an instance of binding knows all abou the
# current state if variables and methods within the given scope.
#
# Defining an ERB templpate
# require ERB library
# create the ERB template from the contents of the template file
# simplify out legislators_by_zipcodee to return the original array of legislators
#
#
#
# outputting formletter to a file
#     Each file should be uniquly names fortunately, each of out attendees has a
#     unique id the first column, or row number.
#
#     Assign an id for the attendee
#     create an output folder
#     Save each form letter to a file based on th id of the attendee
#
#
# Moving Fromm letter generation to a method
#
