#closing files 
=begin 
just as we can open a file for reading or writing, we can close them too.
a file close method forces a flush of the pending data.

=end

datafile = File.open("sample.txt", "r")
lines = datafile.readlines         
datafile.close

lines.each{ |line| puts line } 