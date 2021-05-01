require 'pry'
#debugging 
=begin 
Tracking down and fixing errors and unexpected behavior in the code.
=end


#Reading the stack trace
=begin 
the first lone of the stack trace generally provides the most useful information

debugging.rb:9:in `<main>': undefined local variable or method `maytch' for main:Object (NameError)


the stack trace prints each line of code in the program that was executed  
before the crash

So in the example above it tells us the file and the line that the error was encountered

=end


#using Pry-byebug for debugging
=begin 
Pry is a ruby gem that provides an interactive REPL while running program
similar to the REPL but more funcationality, step-by-step debugging stack navigation

install it in your terminal by running gem install pry-byebug.

to make it avaible in program we need to require 'pry'. to use pry-byebug
need to call binding.pry at any point in the program

more commands for pry-byebug usage
https://github.com/deivid-rodriguez/pry-byebug
help
exit! right away
exit-current expression
ls-for the methods and instances of variables and obj has access to
next- advance one instruction, doesnt get inside methods
step-advance one instruction, stepping into method calls
continue-run until the end or next breakpoint
break
etc.....

Note: hitting enter does the last thing that occured
=end


def double_words_in_phrase(string)
  string_array = string.split(' ')

  binding.pry

  string_array.map { |word| word * 2 }
  string_array.join(' ')
end

double_words_in_phrase("This is a test")

=begin 
Note: That anything after the binding.pry nothing is evalutad. its similar to a breakpoint

=end

require 'pry'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")

=begin 
Generally when you go into a debugging situation

1. The program encounters an error and wont run.
2. The program runs but does not work the way you expected.
=end

#other tools
=begin 
https://www.wireshark.org/ -let you inspect network traffic.

https://mitmproxy.org/ - dealing with SSL-encrypted traffic a mitm (Man in the middle) 
=end