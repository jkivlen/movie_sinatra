class UsersController < ApplicationController

get "/signup" do
    erb :"users/new"
end

posst "/signup" do
    
    

    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect to "/movies"
end

end