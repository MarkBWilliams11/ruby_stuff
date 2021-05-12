=begin 
read- to read files we use "r" 
Every read begins where the last read operation ended
=end

file = File.open("sample.txt",'r')
content = file.read
puts content #=> "Hello fil!"

content =file.read #=> ""

#Using readline and readlines 
=begin 
When dealing with delimited files  such as comma-delimited text files, its more
convenient to read the file line by line. the readlines method can draw in all the 
content and automatically parse it as an array, splitting the file contents by the line
breaks.
=end
File.open("sample.txt").readlines.each do |line|
puts line
end

=begin 
The readline method reads a singular line.
each read file move the file handle foward in the file.
if keep calling the readline until end will get an error

File class contains eof? method, which returns true if there is no more data in the file to read.

often used with while or unless
=end

file = File.open("sample.txt","r")
while !file.eof?
  line = file.readline
  puts line 
end

#careful loading to dozen of megabytes at once, readline is more efficent