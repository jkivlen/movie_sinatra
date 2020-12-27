class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        
        # if params[:user].values.any?{|value| value.blank?}
        if params[:user][:username] == "" || params[:user][:password] == ""
            flash[:message] = "Your username or password was left blank.  Pleasey try again."
            redirect to "/signup" 
        else

            user = User.create(params[:user])
            session[:user_id] = user.id
            redirect to "/movies"
        end
    end

    get "/login" do
        erb :"users/login"

    end

    post "/login" do
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/movies"
        else
            flash[:message] = "Your credentials were invalid.  Please sign up or try again"
            redirect to "/login"
        end
    end


    get "/logout" do
        session.clear
        flash[:message] = "You are now logged out"
        redirect to '/login'

    end




end