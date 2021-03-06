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
    deselect_piece
    starting_piece.deselect!
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

  def check_diagonal(startpos, finalpos)
      row1, col1 = startpos
      row2, col2 = finalpos
      result = []
      until [row1, col1] == finalpos
        row1 > row2 ? row1 -= 1 : row1 += 1
        col1 > col2 ? col1 -= 1 : col1 += 1
        result << [row1, col1]
      end
      result[0..-2]
  end

  def obstructing_piece?(piece, start_pos, end_pos)
    row1, col1 = start_pos
    row2, col2 = end_pos
    team = piece.color
    if col1 == col2
      (row1 + 1 .. row2).each do |row|
        cell = @grid[row][col1]
        return true if cell.class != NullPiece && [row, col1] != end_pos
      end
    end
    if row1 == row2
      (col1 + 1 .. col2).each do |col|
        return true if cell.class != NullPiece && [row, col1] != end_pos
      end
    end

    return true if team == self[end_pos].color
    if piece.class == Bishop
      results = check_diagonal(start_pos, end_pos)
      return true if results.any? { |pos| self[pos].class != NullPiece }
    end
    return true if team == self[end_pos].color
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

  # def selected
  #
  # end
  #
  # def select_piece
  #
  # end
  def deselect_piece
    @selected_piece_pos = nil

  end

  def select_piece(pos)
    if @selected_piece_pos.nil?
      @selected_piece_pos = pos
    end
  end

  def selected_piece?
    !@selected_piece_pos.nil?
  end

  def enter_key(pos)
    cell = self[pos]
    if !selected_piece?
      # self[pos].selected = true
      if cell.select!
        @selected_piece_pos = pos
      end
    elsif @selected_piece_pos == pos
      cell.deselect!
      deselect_piece
    else
      move_piece(@selected_piece_pos, pos)
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
        color = (row > 5 ? :white : :black)
        if KNIGHTS.include?(position)
          symbol = "\u2658"
          @grid[row][col] = Knight.new([row,col], symbol, color)
        elsif BISHOPS.include?(position)
          symbol = "\u2657"
          @grid[row][col] = Bishop.new([row,col], symbol, color)
        elsif ROOKS.include?(position)
          symbol = "\u2656"
          @grid[row][col] = Rook.new([row,col], symbol, color)
        elsif QUEENS.include?(position)
          symbol = "\u2655"
          @grid[row][col] = Queen.new([row,col], symbol, color)
        elsif KINGS.include?(position)
          symbol = "\u2654"
          @grid[row][col] = King.new([row,col], symbol, color)

        else
          symbol = "\u2659"
          @grid[row][col] = Pawn.new([row,col], symbol, color)
        end
      end
    end
  end



end
