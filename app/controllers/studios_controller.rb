class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])

    @movies = @studio.movies

    studio_actors = Actor.actors_by_studio_ordered_by_age_desc(@studio.id)

    @actors = studio_actors.where('currently_working = ?', true)
  end
end
