require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'top_session'
  end

  get "/" do
    erb :welcome
  end

  get "/hello_world" do
    erb :hello_world
  end



end
