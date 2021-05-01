#regex 
=begin 
stands for regular expression. it is a sequence of characters that form 
pattern matching rules. and is applied to a string to look for matches
ex: check if pattern "ss" appears in "mississippi"
ex: print out the 3rd word of each sentence from a list of sentences
ex: find and replace all instances of "Mrs" with "Ms" in a sentence
ex: are there any whitespace characters in the string?
ex: find and replace all non-alphanumerical characters in a 
    string with "-"

and more...

creating a regex starts with the forward slash character (/).
inside two forward slashes can place characters to match with a string

=~ operator to see if we have a match in our regex.
=end

p "powerball"=~/b/ #=> 5
#means firist match took place at the fifth index
# boolean_regex.rb

#use as a boolean to check for matches

def has_a_b?(string)
  if string =~ /b/
    puts "We have a match!"
  else
    puts "No match here."
  end
end

has_a_b?("basketball")#=>"We have a match!"
has_a_b?("football")#=>"We have a match!"
has_a_b?("hockey")#=>"No match here."
has_a_b?("golf")#=>"No match here."

#match Method
=begin 
preforms regex comparisons aswell. returns a matchData obj that describes the 
match or nil is no match
=end
p /b/.match("powerball") #=> #<MatchData "b">

#we can get the same results as above
def has_a_b?(string)
  if /b/.match(string)
    puts "We have a match!"
  else
    puts "No match here."
  end
end

has_a_b?("basketball")#=>"We have a match!"
has_a_b?("football")#=>"We have a match!"
has_a_b?("hockey")#=>"No match here."
has_a_b?("golf")#=>"No match here."

p "some standard ruby classes"

=begin 
ruby has a library of or methods that may help. built-in method make 
lives much easier 
=end

p Math.sqrt(400) #=> 20.0

#the PI below is a constant that come from math module
p Math::PI #=> 3.141592653589793

#what to calculate what specfic day july 4th occured in 2008?
p t = Time.new(2008, 7, 4) #=> 2008-07-04 00:00:00 -0400
p t.monday? #=> false
p t.friday? #=> true


