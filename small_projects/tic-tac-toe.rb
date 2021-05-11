LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

module Board
  def print_board
    col_separator = ' | '
    row_separator = '--+---+--'
    label_for_position = ->(position) { @board[position] || position }

    row_for_display = ->(row) { row.map(&label_for_position).join(col_separator) }
    row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    rows_for_display = row_positions.map(&row_for_display)
    puts rows_for_display.join("\n" + row_separator + "\n")
  end
end

class Player
  attr_reader :marker #=> to get the maker X, O

  def initialize(game, marker)
    @game = game
    @marker = marker
  end
end

class Start < Player
  attr_reader :marker

  def select_position!
    @game.print_board
    loop do
      puts "player #{marker} make a selection on grid: "
      selection = gets.to_i
      return selection if @game.free_position.include?(selection)

      puts "Make another selection. Poisition #{selection} already exists"
    end
  end
end

class Game < Start
  include Board

  attr_reader :board, :curr_player_id

  def initialize(player_1, player_2)
    @board = Array.new(10)
    @curr_player_id = 0
    @players = [player_1.new(self, 'X'), player_2.new(self, 'O')]
    puts "#{@curr_player} goes first"
  end

  def play
    loop do
      make_selection(current_player)
      if player_win?(current_player)
        puts "#{current_player} Wins!"
        print_board
        return
      elsif board_full?
        puts "It's a draw"
        print_board
        return
      end
      switch_players!
    end
  end

  def board_full?
    free_position.empty?
  end

  def player_win?(player)
    LINES.any? do |line|
      line.all? { |position| @board[position] == player.marker }
    end
  end

  def current_player
    @players[curr_player_id]
  end

  def other_player_id
    1 - @curr_player_id
  end

  def switch_players!
    @curr_player_id = other_player_id
  end

  def make_selection(player)
    position = player.select_position!
    puts "#{player} selects #{player.marker} position #{position}"
    @board[position] = player.marker
  end

  def free_position
    (1..9).select { |position| @board[position].nil? }
  end
end

players = [Start, Start].shuffle
Game.new(*players).play
