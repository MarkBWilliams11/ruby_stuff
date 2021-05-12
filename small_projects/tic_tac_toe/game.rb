require_relative 'game_logic'
require_relative 'code_breaker'
require_relative 'code_maker'

# codebreaker or #codemaker
# number of rounds

# any 4 combonation of colors even 2 or more of the same color
# indication of right color in the right position
# and indication of right color but not in the right position

# points codemaker gets 1 point for a row played by code breaker
# if code breaker doesnt not solve comkaer get 11 points
module GameIntroText
  #=>instructions to begin the game
  def game_start_text
    puts 'Welcome to mastermind!'
    puts 'Can you make and unbreakable code?'
    puts 'Can you break someone else code?'
    puts 'Select 1 - to be the code creator, the computer is your opponent'
    puts 'Select 2 - try to break the code, the computer secretly shields'
    puts
    puts 'Clues will be offered throughout the game'
    puts 'note: clues have not particular order'
    puts 'will dispy: X Right number but wrong position'
    puts 'will display: O Right number and corect position'
  end
end

class Game
  include GameIntroText

  #=> check user input?(1 or 2) to start game
  def play
    game_start_text #=>intro text
    game_selection = maker_or_breaker_input

    code_maker if game_selection == '1'
    code_breaker if game_selection == '2'
  end

  #=>user input 1=codemaker 2=codebreaker
  def maker_or_breaker_input
    puts 'Enter your choice'
    input = gets.chomp
    return input if input.match(/^[1-2]$/)

    puts 'Select 1 or 2'
    maker_or_breaker_input
  end

  def code_breaker
    puts 'Lets see if you can break the code!'
    CodeBreaker.new.play
  end

  def code_maker
    puts 'Can you make an unbreakable code?'
    CodeMaker.new.play
  end
end

Game.new.play
