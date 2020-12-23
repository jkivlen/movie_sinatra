class MoviesController < ApplicationController

    get '/movies/new' do

        erb :"movies/new"
    end

    post '/movies' do
        movies = Movie.create(params)
        redirect "/movies"

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
            redirect "/movies"
    end

   get '/movies/:id/edit' do
        @movie = Movie.find_by(id: params[:id])


    erb :"movies/edit"
   end

   patch "/movies/:id/edit" do
    @movie = Movie.find_by(id: params[:id])
    @movie.update(params[:movie])
    redirect to "/movies/#{@movie.id}"
   end

   delete "/movies/:id" do
        @movie = Movie.find_by(id: params[:id])
        @movie.destroy
        redirect to "/movies"
   end


end