 dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(words,array)
result = array.reduce(Hash.new(0)){|acc,word| #=> reduce method on array to get word value and create a new hash
count  = words.downcase.scan(/(#{word})/).count
#count
 #=> changes our words to lowercase. 
 #=>scan our words string and checks regex match for array
 #=> and acounts the number of mathching regexs
acc[word] = count 
#=>creates the new hash over iterations with the word as the key/value pairs
#=>the word as thhe key and the number of matching regex as the value 
acc#=>the single hash from reduce with final results
}
p words#=> method did not change the original
end

p substrings("Howdy partner, sit down! How's it going?",dictionary)