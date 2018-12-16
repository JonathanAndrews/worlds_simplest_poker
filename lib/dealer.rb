# frozen_string_literal: true

# The Dealer runs the game, allocating the cards and calculating the winner.
class Dealer

  DECK_SIZE = 52
  DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  attr_reader :players, :hand_size, :deck

  def initialize(players, hand_size)
    @players = players
    @hand_size = hand_size
    reset_deck
  end

  def deal
    players_hash = setup_players
    allocate_cards(players_hash)
  end

  def calculate_winner(hands)
    winner_array = hands.max_by { |_k, v| v.sum }
    winner_array[0]
  end

  def enough_cards?
    players * hand_size < DECK_SIZE
  end

  def reset_deck
    @deck = DECK.dup
  end

  private

  def setup_players
    player_hash = {}
    (1..players).each do |i|
      player = 'player_' + i.to_s
      player_hash[player.to_sym] = []
    end
    player_hash
  end

  def allocate_cards(player_hash)
    (1..players).each do |i|
      player = 'player_' + i.to_s
      hand = select_cards(hand_size)
      player_hash[player.to_sym].push(*hand)
    end
    player_hash
  end

  def select_cards(quantity)
    hand = []
    quantity.times do
      selected_index = Kernel.rand(deck.length)
      hand << deck.delete_at(selected_index)
    end
    hand
  end
end
