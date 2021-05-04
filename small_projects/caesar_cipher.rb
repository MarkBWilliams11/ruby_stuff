
def caesar_cipher(string, shift) 
  characters=string.split("").map{|chars| # splits  string and map for elements
  base = chars.ord < 91 ? 65 : 97 #set base to 65 if char.ord less 91 else set to 97
    if chars =~/([a-zA-Z])/ #=> check for matching letters
      result = (((chars.ord - base )+ shift)%26)+ base #operation to loop back z from a
      result.chr #converts numbers back to ASCII 
    else
      #keeps puncuation and signs
      chars
    end
  }
  puts characters.join("")# joins string back together
end
 caesar_cipher("What a string!",0)

