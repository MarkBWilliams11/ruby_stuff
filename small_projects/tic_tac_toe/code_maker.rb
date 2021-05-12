require_relative 'game_logic'

class CodeMaker
  include GameLogic
  attr_accessor :player_input, :computer_guess, :grab_number, :same_number

  def play
    "Please enter a 4-digit 'master code' for the computer to break."
    @player_input = player_code_input.split(//)
    puts "The Master code: #{@player_input.join('')}"
    coumputer_rounds(player_input)
    won(player_input, computer_guess)
  end

  #=> The users input for the code to be guess by computer
  def player_code_input
    user_input = gets.chomp
    return user_input if user_input.match(/^[1-6]{4}$/)

    player_code_input
  end

  #=> computers random guesses
  def computer_code_input
    number = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    computer_input = number.shuffle
    computer_input.map(&:to_s)
  end

  def coumputer_rounds(player_input)
    computer_turns = 1

    until computer_turns > 12
      @computer_guess = computer_code_input
      puts "Computers current turn: #{computer_turns}"
      reveal_code(computer_guess)
      compare(player_input, computer_guess)
      clue_indicators(grab_number, same_number)
      break if correct_guess?(player_input, computer_guess)

      computer_turns += 1
      sleep(1)

    end
  end

  def won(player_input, computer_guess)
    if correct_guess?(player_input, computer_guess)
      puts "You broke the code.\n(⌐■_■)"
      puts "Matercode: #{player_input} Computer code: #{computer_guess}"
    else
      puts "Game Over \n(╯°□°）╯︵ ┻━┻"
      puts "Matercode: #{player_input} Computer code: #{computer_guess}"
      # reveal_code(player_input)
    end
  end
end
