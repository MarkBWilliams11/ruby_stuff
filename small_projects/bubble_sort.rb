bubble= [4,3,78,2,0,2]

def bubble_sort(array)
  
    loop do #=>starts loop
      swapped=false #=> false boolean for final swap
      (array.length-1).times do |i|#=> continue loop the array length-1
        if array[i]> array[i+1] #=> if curr array index greater then following index we switch
          array[i], array[i+1] = array[i+1], array[i]
          swapped=true 
        end
      end 
      break if !swapped#=> swapped in loop in true so it not equal, we breakout
    end
p array
end
bubble_sort(bubble)#=>[0, 2, 2, 3, 4, 78]