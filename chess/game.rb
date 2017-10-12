require_relative 'display'
require_relative 'cursor'
require_relative 'piece'
require_relative 'board'

class Game
  attr_accessor :board, :display, :players

  def initialize(players = ["bo", "sa"])
    @players = players
    @board = Board.new
    @display = Display.new(@board)
  end

  def game_over
    @board.game_over
  end

  def play
    until game_over
      @display.get_input
      @display.render
    end
  end

  private

  def notify_players

  end

  def move_piece

  end

  def swap_turn!

  end


end

game = Game.new
game.play



# game.play
