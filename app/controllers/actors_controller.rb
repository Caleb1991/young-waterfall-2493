class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])

    movies = Movie.joins(:actors_movies).where('actor_id = ?', @actor.id)

    @co_stars = movies.map do |movie|
      Actor.joins(:actors_movies).where('movie_id = ?', movie.id)
    end.flatten.uniq
  end
end
