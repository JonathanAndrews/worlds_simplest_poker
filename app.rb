# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/dealer'

# these are the routes for simple poker application
class SimplePoker < Sinatra::Base

  enable :sessions
  set :session_secret, "Ssssshhh! secret"

  get '/' do
    erb :configure_game
  end

  post '/' do
    players = params["no_of_players"]
    hand_size = params["hand_size"]
    session[dealer] = Dealer.new(players, hand_size)
    redirect '/result'
  end

  get 'result' do
    dealer = session[dealer]
    hands = dealer.deal
    dealer.calculate_winner(hands)
  end

end
