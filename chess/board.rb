class OutOfBoundError < StandardError
end
class InvalidMoveError < StandardError
end
class EmptySpaceError < StandardError
end

class Board
  attr_accessor :grid, :selected_piece_pos, :game_over
  ROOKS = [[0,0], [0,7], [7,7], [7,0]]
  KNIGHTS = [[0,1], [0,6], [7,6], [7,1]]
  BISHOPS = [[0,2], [0,5], [7,5], [7,2]]
  KINGS = [[0, 4], [7, 4]]
  QUEENS = [[0, 3], [7, 3]]


  def initialize(grid = empty_grid)
    @grid = grid
    @selected_piece_pos = nil
    fill_initial_rows
    @game_over = false
  end

  def move_piece(start_pos, end_pos)
    row1, col1 = start_pos
    row2, col2 = end_pos
    starting_piece = @grid[row1][col1]
    ending_piece = @grid[row2][col2]
    begin
      valid_move?(starting_piece, start_pos, end_pos)
    rescue OutOfBoundError
      puts "Out ouf bounds"
      return false
    rescue InvalidMoveError
      puts "Invalid move for #{starting_piece.sym}"
      return false
    end
    @selected_piece_pos = nil
    @grid[row2][col2] = starting_piece
    clear_cell(start_pos)
    return true
  end

  def clear_cell(pos)
    x, y = pos
    @grid[x][y] = NullPiece.instance
  end



  def valid_move?(piece, start_pos, end_pos)
    # p piece.moves(start_pos)
    if start_pos.nil?
      raise OutOfBoundError
    elsif piece.class == NullPiece
      raise EmptySpaceError
    elsif !piece.moves(start_pos).include?(end_pos)
      raise InvalidMoveError
    elsif obstructing_piece?(piece, start_pos, end_pos)
      puts "Blocking piece!"
      raise InvalidMoveError
      #handle invalid move
    end
  end

  def obstructing_piece?(piece, start_pos, end_pos)
    row1, col1 = start_pos
    row2, col2 = end_pos
    if col1 == col2
      (row1 + 1 .. row2).each do |row|
        return true if @grid[row][col1].class != NullPiece
      end
    end
    if row1 == row2
      (col1 + 1 .. col2).each do |col|
        return true if @grid[row1][col].class != NullPiece
      end
    end
    false

  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end


  def size
    @grid.length
  end

  def enter_key(pos)
    if @selected_piece_pos.nil?
      if cell_filled?(pos)
        self[pos].selected = true
        @selected_piece_pos = pos
      end
    else
      move_piece(@selected_piece_pos, pos)
      self[pos].selected = false
    end
  end

  def cell_filled?(pos)
    self[pos].class != NullPiece
  end

  def escape_key
    @game_over = true
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
          symbol = "\u2658"
          @grid[row][col] = Knight.new([row,col], symbol)
        elsif BISHOPS.include?(position)
          symbol = "\u2657"
          @grid[row][col] = Bishop.new([row,col], symbol)
        elsif ROOKS.include?(position)
          symbol = "\u2656"
          @grid[row][col] = Rook.new([row,col], symbol)
        elsif QUEENS.include?(position)
          symbol = "\u2655"
          @grid[row][col] = Queen.new([row,col], symbol)
        elsif KINGS.include?(position)
          symbol = "\u2654"
          @grid[row][col] = King.new([row,col], symbol)

        else
          symbol = "\u2659"
          @grid[row][col] = Pawn.new([row,col], symbol)
        end
      end
    end
  end



end
