# frozen_string_literal: true

# Each card has a Suit, Value and Score.
class Card
  attr_reader :suit, :value, :score
  def initialize(suit, value, score)
    @suit = suit
    @value = value
    @score = score
  end
end
