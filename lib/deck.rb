# frozen_string_literal: true

# The Deck contains the contains the cards
class Deck
  CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13].freeze

  attr_reader :cards
  def initialize
    @cards = CARDS.dup
  end

  def size
    cards.length
  end

  def remove_card(index)
    cards.delete_at(index)
  end

  def reset
    @cards = CARDS.dup
  end
end
