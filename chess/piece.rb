require 'singleton'

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
        result << [r,c] if [r,c] != pos
      end
    end
    result
  end
end

class Piece
  attr_accessor :pos, :selected, :sym, :color
  def initialize(pos=[0,0], sym = " ", color = :black)
    @pos = pos
    @selected = false
    @sym = sym
    @color = color
  end

  def select!
    @selected = true
    true
  end

  def deselect!
    @selected = false
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

class NullPiece < Piece
  include Singleton
  def initialize
    super([0,0], sym= " ", :blue)
  end

  def moves

  end
  def select!

  end

end

class Pawn < Piece
  def moves(pos)
    row, col = pos
    [[row + 1, col], [row - 1, col]]
  end
end

class Rook < Piece
  include SlidingPiece

  def moves(pos)
    result = []
    row_start, col_start = pos
    for row in 0..7
      for col in 0..7
        result << [row ,col] if row == row_start
        result << [row, col] if col == col_start
      end
    end
    result
  end
end

class Bishop < Piece

  def moves(pos)
    row_start, col_start = pos
    result = [[row_start, col_start]]
    for row in 0..7
      for col in 0..7
        if (row - row_start).abs == (col - col_start).abs
          result << [row, col]
        end
      end
    end
    result
  end
end
class Queen < Piece

  def moves(pos)
    row_start, col_start = pos
    result = [[row_start, col_start]]
    for row in 0..7
      for col in 0..7
        if (row - row_start).abs == (col - col_start).abs
          result << [row, col]
        end
        result << [row ,col] if row == row_start
        result << [row, col] if col == col_start
      end
    end
    result
  end
end

class King < Piece
  def moves(pos)
    row = pos[0]
    col = pos[1]
    result = []
    (row - 1 .. row + 1).each do |r|
      (col - 1 .. col + 1).each do |c|
        result << [r,c] if [r,c] != pos
      end
    end
    result
  end
end

class Knight < Piece
  def moves(pos)
    row, col = pos
      result = []
      ((row - 2)..(row + 2)).each do |i|
        ((col - 2)..(col + 2)).each do |j|
          if (i - row).abs + (j - col).abs == 3
            result << [i, j] if i.between?(0,8) && j.between?(0, 8)
          end
        end
      end
      result
    end
end
