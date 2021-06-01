class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])

    movies = Movie.joins(:actors_movies).where('actor_id = ?', @actor.id)

    fellow_stars = movies.map do |movie|
      Actor.joins(:actors_movies).where('movie_id = ?', movie.id)
    end.flatten.uniq

    fellow_stars.shift

    @co_stars = fellow_stars
  end
end
