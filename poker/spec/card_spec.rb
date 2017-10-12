require 'card'
require 'rspec'
RSpec.describe Card do
  subject(:card) { Card.new("5", "H") }
  describe "#initialize" do
    it "takes a suit and value" do
      expect(card.suit).to eq("H")
      expect(card.value).to eq("5")
      # expect(card.value).to be_an_instance_of(String)
      # expect(card.value).to eq(5)
      # expect(card.value.length).to eq(1)
      # expect(card.suit).to be_an_instance_of(String)
      # expect(card.suit.length).to eq(1)
    end

  end
  describe "#display" do
    it "displays cards" do
      expect(card.display).to eq("5H")
    end
  end
end
