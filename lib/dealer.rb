class Dealer
  CARDS = [1,2,3,4,5,6,7,8,9,10,
           11,12,13,14,15,16,17,18,19,20,
           21,22,23,24,25,26,27,28,29,30]

  attr_reader :players, :hand_size

  def initialize(players, hand_size)
    @players = players
    @hand_size = hand_size
  end

  def deal 
    players_hash = setup_players
    allocate_cards(players_hash)
  end

  private

  def setup_players
    player_hash = {}
    for i in 1..players do
      player = "player_" + i.to_s
      player_hash[player.to_sym] = []
    end
    player_hash
  end

  def allocate_cards(player_hash)
    for i in 1..players do
      player = "player_" + i.to_s
      hand = CARDS.sample(hand_size)
      player_hash[player.to_sym].push(*hand)
    end
    p player_hash
    player_hash
  end

end