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
          print " #{piece.to_s} ".colorize(:background => :light_white)
        elsif @board[pos].selected
          print " #{piece.to_s} ".colorize(:background => :green)
        else
            color = @board[pos].color
            if (col.even? && row.even?) || (col.odd? && row.odd?)
              print " #{piece.to_s.colorize(color)} ".colorize(:background => :light_black)
            else
              print " #{piece.to_s.colorize(color)} ".colorize(:background => :light_blue)
            end
        end

      end
      print "\n"
    end
    print "\n"
    print "\n"
    print "\n"

  end


  def get_input
      @cursor.get_input
  end

end
