class Display

  def initialize
    @board = [0,1,2,3,4,5,6,7,8]
    @player_moves = Array.new
    @computer_moves = Array.new
  end

  def print_board
  sep = '|  '
  puts @board[0..2].join(sep)
  puts @board[3..5].join(sep)
  puts @board[6..8].join(sep)
  end

  def move_on_board
    puts "Make your move"
    begin
      player_move = gets.chomp.to_i
      if player_move >= 0 && player_move <= 8
        if @board[player_move].is_a? Numeric
          break
        else
          puts "That spot is already taken.  Make another move"
        end
      else
        puts "Valid positions are in the range 0 to 8.  Make another move"
      end
    end while true
    @player_moves.push(player_move)
    @board[player_move] = "x"

    if winning == "x" || board_full?
      return
    end

    begin
      set_move = @board.sample
    end until set_move.is_a? Numeric
    @computer_moves.push(set_move)
    @board[set_move] = "o"
  end

  def display(player_move,set_move)
      sep = '| '
  puts @board[0..2].join(sep)
  puts @board[3..5].join(sep)
  puts @board[6..8].join(sep)
  end


  def winning
    if @board[0] == @board[1] && @board[1] == @board[2]
      return @board[0]
    end
    if @board[3] == @board[4] && @board[4] == @board[5]
      return @board[3]
    end
    if @board[6] == @board[7] && @board[7] == @board[8]
      return @board[6]
    end
    if @board[0] == @board[3] && @board[3] == @board[6]
      return @board[0]
    end
    if @board[1] == @board[4] && @board[4] == @board[7]
      return @board[1]
    end
    if @board[2] == @board[5] && @board[5] == @board[8]
      return @board[2]
    end
    if @board[0] == @board[4] && @board[4] == @board[8]
      return @board[0]
    end
    if @board[2] == @board[4] && @board[4] == @board[6]
      return @board[2]
    end
    return ""
  end

  def board_full?
    @board.each do |value|
      if value.is_a? Numeric
        return false
      end
    end
    return true
  end
end

