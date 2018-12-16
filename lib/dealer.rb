class Dealer

  attr_reader :players, :hand_size, :cards

  def initialize(players, hand_size)
    @players = players
    @hand_size = hand_size
    @cards = [1,2,3,4,5,6,7,8,9,10,11,12,13,
              1,2,3,4,5,6,7,8,9,10,11,12,13,
              1,2,3,4,5,6,7,8,9,10,11,12,13,
              1,2,3,4,5,6,7,8,9,10,11,12,13]
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
      hand = select_cards(hand_size)
      player_hash[player.to_sym].push(*hand)
    end
    player_hash
  end

  def select_cards(quantity)
    hand = []
    for i in 1..quantity do
      p cards
      hand << cards.delete_at(rand(cards.length))
    end
    hand
  end

end