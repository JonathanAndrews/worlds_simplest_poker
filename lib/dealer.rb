class Dealer

  attr_reader :players, :hand_size

  def initialize(players, hand_size)
    @players = players
    @hand_size = hand_size
  end

  def deal 
    result = []
    for i in 1..players do
      result.push({})
    end
    result
  end
end