require 'sinatra/base'

class RPS < Sinatra::Base
  enable :sessions
  attr_reader :name, :move
  
  get '/' do
    erb :index
  end

  post '/start_game' do
    session[:player1] = params[:player1]
     redirect '/play'
  end

  get '/play' do
    @name = session[:player1]
    erb :play
  end

  post '/chooses_action' do
    session[:move] = params[:move]
    redirect 'move'
  end

  get '/move' do
    @move = session[:move]
    @name = session[:player1]
    erb :move
  end
    run! if app_file == $0
end