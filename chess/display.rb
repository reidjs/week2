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
          print "[#{piece.to_s.colorize(:blue)}]"
        elsif @board[pos].selected
          print "[#{piece.to_s.colorize(:green)}]"
        else
          print "[#{piece}]"
        end

      end
      print "\n"
    end
  end

  def select_position(pos)
    move(pos)
  end



  def move(start_pos)
      input = @cursor.get_input
      # puts "Move piece from #{@cursor.start} to #{@cursor.cursor_pos}."
  end

end
