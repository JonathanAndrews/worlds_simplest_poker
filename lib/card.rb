# frozen_string_literal: true

# Each card has a Suit, Value and Score.
class Card
  attr_reader :suit, :value, :score, :suit_score
  def initialize(suit, value, score)
    @suit = suit
    @value = value
    @score = score
    @suit_score = assign_suit_score
  end

  private
  def assign_suit_score
    case suit
    when "Hearts"
      4
    when "Spades" 
      3
    when "Diamonds"
      2
    when "Clubs"
      1
    end
  end
end
