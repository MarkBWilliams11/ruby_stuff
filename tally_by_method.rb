#tally_by
=begin 
Similar to map, but uses the value returned as he key to 
keep a tally of.
=end

[1,2,3].tally_by {|v| v.even?}