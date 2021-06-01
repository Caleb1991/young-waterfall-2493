class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])

    movies = Movie.movies_by_given_actor(@actor.id)

    fellow_stars = movies.map do |movie|
      Actor.actors_for_given_movie(movie.id)
    end.flatten.uniq

    fellow_stars.shift

    @co_stars = fellow_stars
  end
end
