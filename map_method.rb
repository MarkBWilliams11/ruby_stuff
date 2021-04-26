#map
=begin 
Ruby map method can use arrays hashes and ranges and the mainn uses 
is to transform data. returns data in a new array. orginal stays the same
=end
array =['a','b','c']
p array.map{|letter| letter.upcase} #=>["A", "B", "C"]

#converting hash values to symbols
hash= {bacon: "protein", apple: "fruit"}
p hash.map{|k,v|[k, v.to_sym]}.to_h #=>{:bacon=>:protein, :apple=>:fruit}
=begin 
#to_sym -converts to a symbol
returning a new array with the transformed key and values

the last step to_h converts back into a hash
=end

p "using map method and with_index method"

#here our result becomes a multi dimensional array
array =%w(a b c)
p array.map.with_index{|letter,idx| [letter,idx]} #=> [["a", 0], ["b", 1], ["c", 2]]
#Note: we can also pass a parameter to the index to start from 0

p "When you dont need arguments for map method"

p ["11", "21", "5"].map(&:to_i) #=> [11,21,5]
p ["orange", "apple", "banana"].map(&:class) #=> [string,string,string]

p " map with reduce"

=begin 
we are using 
=end

def map(list, &function)
    list.reduce([]){|acc, val|
      acc.push function.call(val) 
    }

  end
p map([1,2,3]) { |v| v*2}