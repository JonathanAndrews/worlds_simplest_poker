# frozen_string_literal: true

require_relative 'deck'

# The Dealer runs the game, allocating the cards and calculating the winner.
class Dealer
  attr_reader :players, :hand_size, :deck

  def initialize(players, hand_size, deck = Deck.new)
    @players = players
    @hand_size = hand_size
    @deck = deck
    reset_deck
  end

  def deal
    players_hash = setup_players
    allocate_cards(players_hash)
  end

  def calculate_winner(hands)
    scores = total_scores(hands)
    highest_scores(scores)
  end

  def enough_cards?
    players * hand_size < deck.size
  end

  def reset_deck
    deck.reset
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
      selected_index = Kernel.rand(deck.size)
      hand << deck.remove_card(selected_index)
    end
    hand
  end

  def total_scores(hands)
    scores = {}
    hands.each do |player, cards|
      total = 0
      cards.each do |card|
        total += card.score
      end
      scores[player] = total
    end
    scores
  end

  def highest_scores(scores)
    top_score = scores.max_by do |_k, v|
      v
    end
    winners_hash = scores.select { |key, value| value == top_score[1] }
    winners_array = winners_hash.to_a
    winners_array[0]
  end
end
