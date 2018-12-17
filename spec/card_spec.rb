# frozen_string_literal: true

require 'card'

describe Card do
  describe '#initialize' do
    it 'takes a suit, value and score' do
      card = described_class.new('Spades', 'Ace', 1)
      expect(card.suit).to eq('Spades')
      expect(card.value).to eq('Ace')
      expect(card.score).to eq(1)
    end
  end
end
