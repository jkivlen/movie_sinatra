class MoviesController < ApplicationController

    get "/movies" do #index - loads all the movies
        @movies = Movie.all
        
        erb :"movies/index"
    end



end