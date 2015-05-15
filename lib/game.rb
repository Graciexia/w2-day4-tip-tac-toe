require_relative 'display'

class Game

  def initialize
    begin
      # game setup
      @game = Display.new
      puts @game.print_board

      # play the game until a win or draw
      begin
        @game.move_on_board
        puts @game.print_board
      end until @game.winning == "x" || @game.winning == "o" || @game.board_full?

      # display the final game status (win or draw)
      if @game.winning == "x"
        puts "You win!!"
      elsif @game.winning == "o"
        puts "The computer wins!! (haha)"
      else
        puts "This game was a draw!"
      end

      # see if the user wants to play again
      begin
        print "Do you want to play again (y, n)? "
        answer = gets.chomp.upcase
      end until answer == "Y" || answer == "N"
    end until answer == "N"
  end

end










