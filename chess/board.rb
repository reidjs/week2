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
