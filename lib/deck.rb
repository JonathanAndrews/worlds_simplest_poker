# frozen_string_literal: true

require_relative 'card'

# The Deck contains the contains the cards
class Deck
  SUITS = %w[Hearts Spades Diamonds Clubs].freeze
  VALUES = %w[Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King].freeze
  SCORE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13].freeze

  attr_reader :cards, :card_class
  def initialize(card_class = Card)
    @card_class = card_class
    reset
  end

  def size
    cards.length
  end

  def remove_card(index)
    cards.delete_at(index)
  end

  def reset
    @cards = []
    SUITS.each do |suit|
      VALUES.each_with_index do |value, index|
        @cards << card_class.new(suit, value, SCORE[index])
      end
    end
    @cards
  end
end
