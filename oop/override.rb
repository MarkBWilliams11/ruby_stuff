# override

#
# sometimes we want one class that inherits from another to not only
# take the methods of its parents,but to override one or more of them.
#
# For instance, you might have an Email class that inherits from Message.
# Both classes might have a send method that sends them,
# but the e-mail version may have to identify valid e-mail addresses
# and use a bunch of e-mail protocols that Message knows
# nothing about. Rather than add a send_email method to your derived
# class and inherit a send method you’ll never use, you can instead
# just explicitly create a send method in the Email class and have
# it do all the email-sending work.
#
# This new version of send will override (that is, replace) the inherited
# version for any object that is an instance of Email.
#
# below idk i just thinking
# class msg
#   def send
#   end
# end
# class email<msg
#     def send
#     #something
#   end
# end
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    'Punch to the chops!'
  end
end

class Dragon < Creature
  #=> Override the method
  def fight
    'Breathes fire!'
  end
end

berry = Dragon.new('Berry')
p berry.fight
