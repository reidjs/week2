require 'player'
require 'deck'
require 'rspec'
require 'byebug'

RSpec.describe Player do
  # before(:each) do
  #   deck = Deck.new
  #   deck.shuffle!
  # end
  subject(:player) do
    deck = Deck.new

    deck.shuffle!
    x = Player.new(deck)
  end
  describe "#initalize" do

    it "initializes with empty hand" do

      expect(player.hand).to be_empty
    end
    it "references the deck class" do
      expect(player.deck).to be_an_instance_of(Deck)
    end
  end
  describe "#make_move" do

  end
  describe "#bet" do

  end
  describe "#fold" do
    # expect(player.hand).to be_empty
  end

  describe "#get_cards" do

    it "increases cards by its input" do

      player.get_cards(5)
      expect(player.hand.length).to eq(5)
      expect(player.deck.length).to eq(47)

    end
  end

  context "after cards are dealt" do
    subject(:player) do
      deck = Deck.new
      deck.shuffle!
      player = Player.new(deck)
      player.get_cards(5)
      player
    end
    describe "#discard!" do
      it "decreases number of cards by one" do
        player.discard!(3)
        expect(player.hand.length).to eq(4)

      end

    end
  end



end
