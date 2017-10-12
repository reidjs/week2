require 'poker'
require 'rspec'

RSpec.describe Poker do
  subject(:game) {Poker.new(5)}
  describe "#initialize" do
    it "creates a deck" do
      expect(game.deck).to be_an_instance_of(Deck)
    end

    it "initializes the players" do
      expect(game.players.length).to eq(5)
    end
  end

  describe "#deal_hand" do
    it "distributes 5 cards to player" do
      players = game.players
      game.deal_hands
      expect(players.all? { |player| player.hand.length == 5 }).to be true
      expect(game.deck.length).to eq(27)
    end

  end
  describe "#redeal_cards" do
    it "distributes maximum 3 cards to player during round" do
      expect { game.redeal_cards(4, 0) }.to raise_error "Too many cards!"
    end

  end
  describe "#deal" do
    it "deals one card to one player at specified index" do
      player = game.players[0]
      deck = game.deck
      game.deal(0)
      expect(player.hand.length).to eq(1)
      expect(deck.length).to eq(51)
    end

  end

  describe "#prompt_player" do

    it "requests a move from the player" do
      player = double("player")
      #allow(book).to receive(:title) { "The RSpec Book" }
      allow(player).to receive(:get_move)
    end
  end

end
