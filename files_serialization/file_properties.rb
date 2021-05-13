#Fiiles existence and properties 
require 'open-uri'
=begin 
File ans Dir class methods that can determine various properties of
files, including size, its directory and wether or not a file with a given name
exists
=end

#Flie.exists? or directory
filename = "sample.txt"
if File.exists?(filename)
  puts "#{filename} exists"
end

#checking if a directory exists if not the make one
=begin
dirname ="data-files"
Dir.mkdir(dirname) unless File.exists?dirname
File.open("#{dirname}/new-file.txt", 'w'){|file| file.write("Hello New File!")}
=end
#within same directory here
p Dir.glob("data-files").length #=> 1



DIRNAME = 'data-files'

#method that targets a directory and all subdirectories  and prints outs
#the name of 10 that take up the most sidk space

Dir.glob("#{DIRNAME}/**/*.*").sort_by{ |filename| File.size(filename)}.reverse[0..9].each do |filename|
  puts "#{filename}\t#{File.size(filename)}"
end #=> data-files/new-file.txt 15

=begin 
breakdown a file type by a nubmer of files 
breakdown of file types by bytes of disk space
=end
=begin 
hash =  Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |has, filename|
  ext = File.basename(filename).split('.')[-1].to_s.downcase
    has[ext] ||= [0,0]
    has[ext][0] += 1
    has[ext][1] += File.size(filename)
      has
    end
    File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end

=end
#Read a text file and create a google chart

=begin BASE_URL = "https://chart.googleapis.com/chart?cht=p&chs=500x300"
rows = File.open("file-analysis.txt"){|f| f.readlines.map{|p| p.strip.split("\t")} }

headers = rows[0]
[1,2].each do |idx|
   labels = []
   values = []
   rows[1..-1].each do |row|
      labels << row[0]
      values << row[idx]
   end
   
   remote_google_img = URI.open(BASE_URL)
puts remote_google_img
  File.open('file-pie-chart.png', 'w'){|f| 
    f.write(URI.open(remote_google_img))
  }
end =end