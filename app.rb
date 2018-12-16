# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/dealer'

# These are the routes for simple poker application
class SimplePoker < Sinatra::Base
  enable :sessions
  set :session_secret, 'Ssssshhh! secret'
  register Sinatra::Flash

  get '/' do
    erb :configure_game
  end

  post '/' do
    players = params['no_of_players'].to_i
    hand_size = params['hand_size'].to_i
    dealer = Dealer.new(players, hand_size)
    unless dealer.enough_cards?
      flash[:notice] = "Not enough dards in the deck..."
      redirect '/'
    else
      session[:dealer] = dealer
      redirect '/result'
    end 
  end

  get '/result' do
    dealer = session[:dealer]
    @hands = dealer.deal
    @winner = dealer.calculate_winner(@hands)
    erb :winner_screen
  end

  post '/result' do
    dealer = session[:dealer]
    dealer.reset_deck
    redirect '/result'
  end
end
