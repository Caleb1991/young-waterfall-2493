class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])

    @movies = @studio.movies

    studio_actors = Actor.joins(:movies).where('studio_id = ?', @studio.id).distinct.order(age: :desc)

    @actors = studio_actors.where('currently_working = ?', true)
  end
end
