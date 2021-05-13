require_relative 'game_logic'
#=> Computer as code master holding the code
class CodeBreaker
  attr_accessor :the_code, :guess, :grab_number, :same_number

  include GameLogic
  def initialize
    @the_code = random_code
  end

  def random_code
    random_numbers = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    random_numbers.map(&:to_s)
  end

  def play
    start_round
    won(the_code, guess)
  end

  #=> loop for code breaker guesses
  def start_round
    turn = 1
    while turn <= 12
      @guess = guess_input.split(//)
      break if correct_guess?(the_code, guess)

      compare_guess
      turn += 1
    end
  end

  #=> gets the input of the user a number 1-6
  def guess_input
    user_input = gets.chomp
    return user_input if user_input.match(/^[1-6]{4}$/)

    puts 'Your guess must be 4 digits between 1-6.'
    guess_input
  end
end

#=> compare guess with the random code
def compare_guess
  compare(the_code, guess)
  clue_indicators(grab_number, same_number)
end

def won(code_answer, guess)
  if correct_guess?(code_answer, guess)
    puts "You broke the code.\n(⌐■_■)"
    puts "Matercode: #{code_answer} Computer code: #{guess}"
  else
    puts "Game Over \n(╯°□°）╯︵ ┻━┻"
    puts "Matercode: #{code_answer} Computer code: #{guess}"
    # reveal_code(code_answer)
  end
end
