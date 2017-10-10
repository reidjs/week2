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

class Pawn < Piece
  def moves(pos)
    row, col = pos
    [[row + 1, col], [row - 1, col]]
  end
end



class NullPiece < Piece
  include Singleton
  attr_accessor :x
  def moves

  end

end
