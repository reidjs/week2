require_relative 'deck'
require_relative 'player'

class Poker
  attr_accessor :deck, :players
  def initialize(num_players)
    @deck = Deck.new
    @players = Poker.init_players(num_players)


  end
  def deal_hands
    @players.each_index do |player_idx|
      5.times do
        deal(player_idx)
      end
    end
  end

  def redeal_cards(num_cards, player_idx)
    raise "Too many cards!" if num_cards > 3

  end

  def deal(player_idx)
    @players[player_idx].hand << @deck.pop
  end

  def prompt_player(player_idx)
    @players[player_idx].get_move
  end

  def self.init_players(num_players)
    players = []
    num_players.times do
      players << Player.new(@deck)
    end
    players
  end



end
