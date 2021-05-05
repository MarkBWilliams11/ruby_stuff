=begin 
Using mixins to imitate multiple inheritance, giving traits from modules
as needed, we can add an combination
=end

module MartialArts
  def swordsman
    puts "I'm a swordsman."
  end
end




class Ninja
  include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
  include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end

igi=Samurai.new("Igi")

igi.swordsman #=> "I'm a swordsman"