require 'colorize'
require 'byebug'
class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    # @cursor_pos = [0,0]
  end

  def render
    # system("clear")

    @board.size.times do |row|
      @board.size.times do |col|
        pos = [row, col]
        piece = @board[pos].sym
        if pos == @cursor.cursor_pos
          print "[#{piece.to_s}]".colorize(:background => :light_white)
        elsif @board[pos].selected
          print "[#{piece.to_s}]".colorize(:background => :yellow)
        else
          print "[#{piece}]".colorize(:background => :light_black)
        end

      end
      print "\n"
    end
  end


  def get_input
      @cursor.get_input
  end

end
