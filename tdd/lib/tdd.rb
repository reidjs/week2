class Array
  def my_uniq
    results = []
    self.each do |el|
      results << el unless results.include?(el)
    end
    results
  end

  def two_sum
    pairs = []
    self.each_with_index do |el,idx1|
      (idx1+1..length-1).each do |idx2|
        pairs << [idx1,idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pairs
  end

  def my_transpose
    transposed = []
    self[0].length.times do
      transposed << []
    end
    self.each_with_index do |row, rowidx|
      row.each_with_index do |col, colidx|
        transposed[colidx] << col
      end
    end
    transposed
  end

  def stock_picker
    most_profitable = nil
    dates = []
    self.each_with_index do |price,buy_day|
      (buy_day+1..self.length-1).each do |sell_day|
        diff = self[sell_day] - self[buy_day]
        if most_profitable.nil? || diff > most_profitable
          dates = [buy_day,sell_day]
          most_profitable = diff
        end
      end
    end
    dates
  end

end

class TowersOfHanoiGame
  attr_accessor :board
  def initialize
    @board = [[3, 2, 1], [], []]
  end

  def move(from,to)


    raise "Empty peg!" if @board[from].empty?
    # debugger
    if !@board[to].empty? && @board[to].last < @board[from].last
      raise "Invalid move!"
    end
    @board[to] << @board[from].pop


  end

  def win?
    # return false if !@board[0].empty?
    return true if (@board[1].length == 3) || (@board[2].length == 3)
    false
  end

  def get_move
    puts "From whence do you come?"
    from = gets.chomp

    puts "To where are you going?"
    to = gets.chomp
    return [from,to]
  end









end
