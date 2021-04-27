#transducers
=begin 
transducers are composable and effcient data transformation functions
which doesnt create intermediate collections.
=end

#map and select
#map
p [0, 1, 2, 3, 4, 5].map { |x| x + 1 }# => [1, 2, 3, 4, 5,6]

#select
p [1, 2, 3, 4, 5].select { |x| x.even? }# => [2, 4]

#map &select together
p [0, 1, 2, 3, 4, 5]
  .map    { |x| x + 1   }
  .select { |x| x.even? }
  # => [2, 4,6]

  def select_map(list,&function)
    list.reduce([]){ |acc,val|
      result= function.call(val)
      acc.push(result) if result
      acc
    }
  end
  p select_map([1,2,3]) { |v| v} #=> [1,2,3]
#map with reduce 
