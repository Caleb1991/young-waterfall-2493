class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])

    movies = Movie.joins(:actors_movies).where('actor_id = ?', @actor.id)

      movies.map do |movie|
        @actors = Actor.joins(:actors_movies).where('movie_id = ?', movie.id)
      end
      binding.pry
  end
end
