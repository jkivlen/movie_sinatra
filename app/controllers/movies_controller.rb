class MoviesController < ApplicationController

    get '/movies/new' do

        erb :"movies/new"
    end

    post '/movies' do
        if !logged_in?
            flash[:message] = "You must be logged in to add a movie.  Please log in or sign up"
            redirect "/"
        else
            movie = current_user.movies.create(params)
            flash[:message] = "#{movie.name} was added!"
            redirect "/movies"
        end
    end

    get "/movies" do           #index - loads all the movies
        @movies = Movie.all
        
        erb :"movies/index"
    end

    get '/movies/:id' do
        @movie = Movie.find_by(id: params[:id])
        if @movie
            erb :"movies/show"
        else
            flash[:message] = "Your movie ID was invalid"
            redirect to "/movies"
        end
    end

   get '/movies/:id/edit' do
        @movie = Movie.find_by(id: params[:id])
        if @movie.user == current_user
            erb :"movies/edit"
        else
            flash[:message] = "You cannot edit movies which other users have added"
            redirect to "/movies"
        end
   end

   patch "/movies/:id/edit" do
        @movie = Movie.find_by(id: params[:id])
        if @movie.user == current_user
            @movie.update(params[:movie])
            flash[:message] = "You have succesfully edited this movie"
            redirect to "/movies/#{@movie.id}"
        else
            flash[:message] = "You cannot edit movies which other users have added"
            redirect to "/movies"
        end
   end

   delete "/movies/:id" do
        @movie = Movie.find_by(id: params[:id])
        if @movie.user == current_user
            @movie.destroy
            flash[:message] = "You have succesfully deleted this movie"
            redirect to "/movies"
        else
            flash[:message] = "You cannot delete movies which other users have added"
            redirect to "/movies"
        end
   end


end