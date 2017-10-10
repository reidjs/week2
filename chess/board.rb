class OutOfBoundError < StandardError
end

class Board
  attr_accessor :grid, :selected_piece_pos
  ROOKS = [[0,0], [0,7], [7,7], [7,0]]
  KNIGHTS = [[0,1], [0,6], [7,6], [7,1]]
  BISHOPS = [[0,2], [0,5], [7,5], [7,2]]

  def initialize(grid = empty_grid)
    @grid = grid
    @selected_piece_pos = nil
    fill_initial_rows
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
    end
    @selected_piece_pos = nil
    @grid[row2][col2] = starting_piece
    clear_cell(start_pos)
    return true
      #if valid make start_pos null piece
      #else make end_pos the start_position piece
  end

  def clear_cell(pos)
    x, y = pos
    @grid[x][y] = NullPiece.instance
  end



  def valid_move?(piece, start_pos, end_pos)
    if start_pos.nil?
      raise OutOfBoundError
    # elsif !end_pos.nil?
    #   raise "Invalid move"
    end
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

  # def enter_key(pos)
  #   if @piece_selected == 0
  #     self[pos].selected = true
  #     @selected_piece_pos = pos
  #     @piece_selected += 1
  #   elsif @piece_selected == 1
  #     move_piece(@selected_piece_pos, pos)
  #
  #   end
  # end
  def enter_key(pos)
    if @selected_piece_pos.nil?
      self[pos].selected = true
      @selected_piece_pos = pos
    else
      move_piece(@selected_piece_pos, pos)
    end
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
