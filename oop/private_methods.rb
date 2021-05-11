# explicit or private
#
# We can make methods public or private with built in methods
# public or private. We call them before the methods, by which
# they should be above.
#
# -public methods allow for an interface with the rest of the progrgam
#
# -private methods are unreachable, but does it own thing.
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end

  private # This method can't!

  def bank_account_number
    @account_number = 12_345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new('Eric', 26)
eric.about_me # public method
eric.bank_account_number # private method
