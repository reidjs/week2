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

  def play
    puts "hi"

    @display.select_position(pos)
  end

  private

  def notify_players

  end

  def swap_turn!

  end


end

game = Game.new
game.display.render
i = gets.chomp

# game.play
