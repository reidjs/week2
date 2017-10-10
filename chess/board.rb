require 'singleton'
require 'colorize'
require_relative 'cursor'
class Board
  attr_accessor :grid
  ROOKS = [[0,0], [0,7], [7,7], [7,0]]
  KNIGHTS = [[0,1], [0,6], [7,6], [7,1]]
  BISHOPS = [[0,2], [0,5], [7,5], [7,2]]

  def initialize(grid = empty_grid)
    @grid = grid
    fill_initial_rows
  end

  def move_piece(start_pos, end_pos)
    if start_pos.nil?
      raise "Piece not found"
    elsif !end_pos.nil?
      raise "Invalid move"
    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def size
    @grid.length
  end


  def empty_grid
    x = NullPiece.instance
    Array.new(8) { Array.new(8) { x } }
  end

  def fill_initial_rows
    @grid.each_index do |row|
      next if (2..5).include?(row)
      @grid[row].each_index do |col|
        position = [row,col]
        symbol = nil
        if KNIGHTS.include?(position)
          symbol = :k
        elsif BISHOPS.include?(position)
          symbol = :b
        elsif ROOKS.include?(position)
          symbol = :r
        else
          symbol = :p
        end
        @grid[row][col] = Piece.new([row,col], symbol)
      end
    end
  end

end

class Piece
  attr_accessor :pos, :selected, :sym
  def initialize(pos=[0,0], sym = " ")
    @pos = pos
    @selected = false
    @sym = sym
  end

  def moves(pos)

  end

  def to_s
  end

  def empty?()
  end

  def symbol()
  end

  private

  def move_into_check(to_pos)
  end

end

module SlidingPiece

end
#[0,0]
module SteppingPiece
  def get_moves(pos)
    row = pos[0]
    col = pos[1]
    result = []
    (row - 1 .. row + 1).each do |r|
      (col - 1 .. col + 1).each do |c|
        # next if r == c
        result << [r,c] if [r,c] != pos
      end
    end
    result
  end
end

# class Pawn < Piece
#   include SteppingPiece
#
# end

# class Test
#   include SteppingPiece
# end
# z = Test.new
# p z.get_moves([1,1])

class NullPiece < Piece
  include Singleton
  attr_accessor :x
  def moves

  end

end

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

class Game

  def initialize(players)
    @players = players
    @board = Board.new
    @display = Display.new(@board)
  end

  def play

  end

  private

  def notify_players

  end

  def swap_turn!

  end


end

b = Board.new
d = Display.new(b)
# input = d.cursor.get_input
f = d.move([0,0])
d.render
p f
f = d.move(f)
d.render
p f
f = d.move(f)
d.render
p f
f = d.move(f)
d.render
p f


# d.move(0)
# d.move(0)
# d.move(0)
# d.move(0)
