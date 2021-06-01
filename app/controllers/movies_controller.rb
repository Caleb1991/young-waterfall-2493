class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])

    @actors = Actor.actors_for_given_movie(@movie.id)

    if params[:name] != nil
      @search_results = Actor.where('name = ?', params[:name])
    end
  end
end
