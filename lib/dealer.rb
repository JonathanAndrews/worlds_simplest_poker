class Dealer

  attr_reader :players, :hand_size

  def initialize(players, hand_size)
    @players = players
    @hand_size = hand_size
  end
end