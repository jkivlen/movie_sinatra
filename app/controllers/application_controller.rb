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

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      # @current_user ||= User.find_by(id: session([:user_id])
      if @current_user
        @current_user
      else
        @current_user = User.find_by(id: session[:user_id])
      end
    end


  end


end
