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
        piece = @board[[row,col]].sym
        if [row, col] == @cursor.cursor_pos
          print "[#{piece.to_s.colorize(:blue)}]"
        else
          print "[#{piece}]"
        end

      end
      print "\n"
    end
  end

  def move(start_pos)
    # render
    # until @cursor.start.nil?
      input = @cursor.get_input
      puts "Move piece from #{@cursor.start} to #{@cursor.cursor_pos}."
      # if input.is_a?(Array)
      #   difference = @cursor.difference
      #   p start_pos
      #   end_pos = start_pos.map.with_index {|axis, i| axis + difference[i]}
      # end
    # end
    # end_pos
  end

end
