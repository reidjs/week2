require 'tdd'
require 'rspec'
require 'byebug'

RSpec.describe Array do


  describe "#my_uniq" do
    subject(:arr) { [1, 2, 1, 3, 3] }
    let(:result) { arr.my_uniq }

    it "removes duplicates from an array" do
      expect(result).to eq([1, 2, 3])

    end

    it "doesn't modify original array" do
      arr.my_uniq
      expect(arr).to eq(arr)
    end

    it "returns uniq elements in order they first appeared" do
      expect(result).to_not eq([1, 3, 2])
      expect(result).to_not eq([3, 2, 1])
      expect(result).to eq([1, 2, 3])
    end

  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] }
    let(:result) { arr.two_sum }
    it "finds all indices of pairs that sum to zero" do
      expect(result).to eq([[0, 4], [2, 3]])
    end

    it "sorts dictionary-wise" do
      expect(result[0] )
    end

  end

  describe "#my_transpose" do
    subject(:arr) do
      [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
      ]
    end
    let(:result) { arr.my_transpose }
    let(:transposed_arr) do
      [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ]
    end
    it "transposes array" do
      expect(result).to eq(transposed_arr)
    end
  end

  describe "#stock_picker" do
    subject(:arr) {[0,1,10,-2]}
    let(:result) {arr.stock_picker}
    let(:answer) {[0,2]}

    it "chooses the most profitable days to buy and sell" do
      expect(result).to eq(answer)
    end

    it "does not buy after it sells" do
      expect(answer[0]).to be <(answer[1])
    end


  end

end

RSpec.describe TowersOfHanoiGame do
  subject(:game) { TowersOfHanoiGame.new }
  #game does not initialize until it statement
  #subject is a lazy initializer, it does not initalize the object
  #until an it satement

  let(:board) { game.board }
  describe "#initialize" do
    it "makes an array of three arrays" do
      expect(board.length).to eq(3)
    end

    it "sets all discs on leftmost peg" do
      expect(board[0].length).to eq(3)
    end

    it "sets other pegs to be empty" do
      expect(board[1]).to be_empty
      expect(board[2]).to be_empty
    end
  end

  describe "#move" do

    before(:each) do

      game.board = [[3],[2,1],[]]
    end

    it "moves disk to empty peg" do

      game.move(0,2)

      expect(board).to eq([[],[2,1],[3]])
    end

    it "moves disk onto bigger disk" do
      game.move(1,0)
      expect(board).to eq([[3,1], [2], []])
    end

    it "cannot move from empty peg" do

      expect{game.move(2,0)}.to raise_error "Empty peg!"
    end

    it "shall not move bigger disk onto smaller disk" do
      expect{game.move(0,1)}.to raise_error "Invalid move!"
    end

  end

  describe "#win?" do
    let(:win_one) do
      game.board = [[],[3,2,1],[]]
    end
    let(:win_two) do
      game.board = [[],[],[3,2,1]]
    end
    let(:not_win) do
      game.board = [[],[1],[3,2]]
    end
    it "returns true if game won" do
      win_one
      expect(game.win?).to be true
      not_win
      expect(game.win?).to be false
      win_two
      expect(game.win?).to be true
    end

    it "returns false if game is not won" do
      not_win
      expect(game.win?).to be false
    end
  end



end
