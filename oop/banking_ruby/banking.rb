# Program that can store, update, and display a bank account balance
#
# create an account object with public methods to display balances and transfers
# funds, but which rely on private methods to make sure the users PIN is correct before arrpoving
# transaction
#
# not for real banking
#

class Account
  # read name and balance
  attr_reader :name
  attr_reader :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  private #=> priavte methods for PIN

  # method for pin
  def pin
    @pin = 1234
  end

  # method for error message
  def pin_error
    'Access denied: incorrect PIN.'
  end

  public #=> our public methods to display balance

  def display_balance(pin_number)
    if pin_number == @pin #=>condition to see if pin match
      put "Balance: $#{@balance}"
    else
      puts pin_error
    end
  end

  # withdraw method
  def withdraw(pin_number, amount)
    if pin_number == @pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}"
    else
      pin_error
    end
  end

  # deposit method
  def deposit(pin_number, amount)
    if pin_number == @pin
      @balance += amount
      puts "Deposit #{amount}. New balance: $#{@balance}"
    else
      pin_error
    end
  end
end

p checking_account = Account.new('Mac Dubois', 1_000_000)
p checking_account.deposit(@pin, 1_000_000)

# ??? maybe
# Include error checking that prevents users from overdrawing their accounts
#
# Create CheckingAccounts or SavingsAccounts that inherit from Account
