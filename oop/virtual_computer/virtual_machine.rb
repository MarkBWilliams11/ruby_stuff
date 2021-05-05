class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time=Time.now
    @files[filename]=time
    puts "The new file was created:#{@files}"
  end

  def Computer.get_users
    return @@users
  end
  
end

p my_computer = Computer.new("Mac",123)
 my_computer.create("text.txt")