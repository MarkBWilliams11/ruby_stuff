=begin 
When programing with real-world applications

So datasets maybe to large to include in a program in a predefined string or collection.
=end

file_name = "sample.txt"
some_file = File.open(file_name,"w")
some_file.puts "Hello file!"
some_file.close
=begin 
The File class supplies the basic methods to manipulate files.
opens the sample.txt file and write hello file!
it will appear in the same directory as which the code was run

We also dont havve to make a varible for the file we want to create

some_file = File.open("sample.txt", "w")

w - stands for write() warning using "W" on existing file with erase content of that file
a - to append to exisiting file

close - method finishes the writing process and prevents any futher data opertations on the file

=end

# using block convention 

File.open("test_file.txt","w"){|afile| afile.puts "Hyio File!"}