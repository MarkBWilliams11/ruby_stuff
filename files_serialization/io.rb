# I/O
#
# Input/Output the ways that a computer intercats with the world. Screens,keyboards,
# files, and networks are all forms of I/O. data is sent to and from programs
# as a stream of characters/bytes.
#
# Standard Input - defalut to read from the keyboard
# Starandard Output- default to write to the terminal
# Starndard Error - default to write to the terminal
#
# ruby Constants STDIN,STDOUT,STDERR point to IO objects wrapping the standard streams.
# By default the global variables $stdin, $stdout, $stderr point to their streams
#
# The global can be overwritten to point to another I/O stream such as a file.
# IO objects can be written to put or print
#

$stdout.puts 'Hello World' #=> "Hello World" write-only
#=>puts is alias to stdout coming fromruby kernel module

# $stdin.gets#=> read-only

# Create a new IO object- need file descriptor
p io = IO.new(1) #=> #<IO:fd 1>
io.puts 'hello world'
