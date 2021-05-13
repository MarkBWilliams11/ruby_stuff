module GameLogic
  def compare(code_answer, guess)
    curr_answer = code_answer.clone
    curr_guess = guess.clone
    @grab_number = grab_matches(curr_answer, curr_guess)
    @same_number = same_numbers(curr_answer, curr_guess)
    @total_number = grab_number + same_number
  end

  #=> going through input to check exact matches
  def grab_matches(code_answer, guess)
    grab = 0
    code_answer.each_with_index do |item, idx|
      next unless item == guess[idx]

      grab += 1
      code_answer[idx] = 'O'
      guess[idx] = 'O'
    end
    grab
  end

  #=>check for the same values
  def same_numbers(code_answer, guess)
    same = 0
    guess.each_index do |idx|
      next unless guess[idx] != 'O' && code_answer.include?(guess[idx])

      same += 1
      remove = code_answer.find_index(guess[idx])
      code_answer[remove] = 'X'
      guess[idx] = 'X'
    end
    same
  end

  #=>check if for matches to be the same
  def correct_guess?(code_answer, guess)
    code_answer == guess
  end

  def clue_indicators(grab, same)
    grab.times { print 'O' }
    same.times { print 'X' }
    puts ''
  end

  def reveal_code(arr)
    arr.each do |num|
      puts num
    end
  end
end
