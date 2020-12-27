require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'top_session'
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect to "/movies"
    else
      erb :welcome
    end
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
