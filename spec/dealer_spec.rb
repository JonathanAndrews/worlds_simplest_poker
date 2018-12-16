require 'dealer'

describe Dealer do
  describe "#initialize" do
    it "takes a number of players and a hand size" do
      number_of_players = 2
      hand_size = 2
      dealer = Dealer.new(number_of_players, hand_size)
      expect(dealer.players).to eq(number_of_players)
      expect(dealer.hand_size).to eq(hand_size)
    end
  end
end