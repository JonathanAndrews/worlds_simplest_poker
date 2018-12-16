require 'dealer'

describe Dealer do

  number_of_players = 2
  hand_size = 2

  describe "#initialize" do
    it "takes a number of players and a hand size" do
      dealer = described_class.new(number_of_players, hand_size)
      expect(dealer.players).to eq(number_of_players)
      expect(dealer.hand_size).to eq(hand_size)
    end
  end

  context "in a game of 2 players with 2 cards each" do
    subject(:dealer) { described_class.new(number_of_players, hand_size) }

    describe "#deal" do
      it "allocates cards to the right number of players" do
        result = dealer.deal
        expect(result.length).to eq(number_of_players)
      end
      it "allocates the right number of cards to players" do
        result = dealer.deal
        expect(result[:player_1].length).to eq(hand_size)
        expect(result[:player_2].length).to eq(hand_size)
      end
    end
  end
end