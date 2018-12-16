# frozen_string_literal: true

require 'sinatra/base'

# these are the routes for simple poker application
class SimplePoker < Sinatra::Base
  get '/' do
    erb :configure_game
  end
end
