#require_relative "deck"
class Player
  attr_accessor :hand, :deck
  def initialize(deck)
    @hand = []
    @deck = deck
  end
  def fold
    @hand.each_index do |card|
      discard(card)
    end
  end
  def discard!(idx)
    @hand.delete_at(idx)

  end
  def get_cards(num)
    num.times do
      @hand << @deck.pop
    end

  end
end
