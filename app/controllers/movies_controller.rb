class MoviesController < ApplicationController

    get '/movies/new' do

        erb :"movies/new"
    end

    post '/movies' do
        if !logged_in?
            redirect "/"
        else
            movie = current_user.movies.create(params)
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
            redirect to "/movies"
        end
    end

   get '/movies/:id/edit' do
        @movie = Movie.find_by(id: params[:id])
        if @movie.user == current_user
            erb :"movies/edit"
        else
            redirect to "/movies"
        end
   end

   patch "/movies/:id/edit" do
        @movie = Movie.find_by(id: params[:id])
        if @movie.user == current_user
            @movie.update(params[:movie])
            redirect to "/movies/#{@movie.id}"
        else
            redirect to "/movies"
        end
   end

   delete "/movies/:id" do
        @movie = Movie.find_by(id: params[:id])
        if @movie.user == current_user
            @movie.destroy
            redirect to "/movies"
        else
            redirect to "/movies"
        end
   end


end