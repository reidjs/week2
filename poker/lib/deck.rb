require_relative "card"
class Deck
  attr_accessor :cards
  def initialize
    @cards = Deck.initialize_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  def pop
    @cards.pop
  end

  def length
    @cards.length 
  end


  private
  def self.initialize_deck
    cards = []
    values = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    suits = %w[C H D S]
    suits.each do |suit|
      values.each do |value|
        cards << Card.new(value,suit)
      end
    end
    cards
  end


end
