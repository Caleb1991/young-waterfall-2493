class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])

    @actors = Actor.joins(:actors_movies).where('movie_id = ?', @movie.id)

    if params[:name] != nil
      @search_results = Actor.where('name = ?', params[:name])
    end
  end
end
