require 'deck'
require 'rspec'
RSpec.describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "create a 52 card array" do
      expect(deck.cards.length).to eq(52)
    end

    it "initializes card objects in cards" do
      expect(deck.cards.all?{|c| c.is_a?(Card) }).to be true
    end

    #check unique

  end

  describe "#shuffle" do
    it "changes the order of the cards" do
      unshuffled_cards = deck.cards.dup
      deck.shuffle!
      expect(unshuffled_cards).to_not eq(deck.cards)
    end
  end
end
