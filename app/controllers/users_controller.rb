class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        
        # if params[:user].values.any?{|value| value.blank?}
        if params[:user][:username] == "" || params[:user][:password] == ""

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
            redirect to "/login"
        end
    end


    get "/logout" do
        session.clear
        redirect to '/login'

    end




end