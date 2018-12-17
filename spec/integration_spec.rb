# frozen_string_literal: true

require 'dealer'

describe 'Integration Tests' do
  describe Dealer do
    number_of_players = 2
    hand_size = 2
    DECK_SIZE = 52

    describe '#initialize' do
      it 'takes a number of players and a hand size' do
        dealer = described_class.new(number_of_players, hand_size)
        expect(dealer.players).to eq(number_of_players)
        expect(dealer.hand_size).to eq(hand_size)
      end
    end

    context 'in a game of 2 players with 2 cards each' do
      subject(:dealer) { described_class.new(number_of_players, hand_size) }

      describe '#deal' do
        it 'allocates cards to the right number of players' do
          hands = dealer.deal
          expect(hands.length).to eq(number_of_players)
        end

        it 'allocates the right number of cards to players' do
          hands = dealer.deal
          expect(hands[:player_1].length).to eq(hand_size)
          expect(hands[:player_2].length).to eq(hand_size)
        end

        it 'calls Kernel#rand' do
          allow(Kernel).to receive(:rand).and_return(0)
          expect(dealer.deal).to eq(player_1: [1, 2],
                                    player_2: [3, 4])
        end
      end

      describe '#calculate_winner' do
        it 'takes the hands and calculates the winner' do
          allow(Kernel).to receive(:rand).and_return(0)
          hands = dealer.deal
          expect(dealer.calculate_winner(hands)).to eq(:player_2)
        end
      end

      describe '#enough_cards?' do
        it 'returns false if there are not enough cards' do
          dealer = described_class.new(1, DECK_SIZE + 1)
          expect(dealer.enough_cards?).to eq(false)
        end

        it 'returns true if there are  enough cards' do
          dealer = described_class.new(3, 5)
          expect(dealer.enough_cards?).to eq(true)
        end
      end

      describe '#reset_deck' do
        it 'returns cards to the deck' do
          expect(dealer.deck.size).to eq(DECK_SIZE)
          dealer.deal
          expect(dealer.deck.size).to eq(DECK_SIZE - 4)
          dealer.reset_deck
          expect(dealer.deck.size).to eq(DECK_SIZE)
        end
      end
    end
  end
end
