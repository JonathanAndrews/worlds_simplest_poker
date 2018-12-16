require 'sinatra/base'

class RPS < Sinatra::Base

  get '/' do
    erb :configure_game
  end

  
end
