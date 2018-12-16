require 'sinatra/base'

class SimplePoker < Sinatra::Base

  get '/' do
    erb :configure_game
  end
end
