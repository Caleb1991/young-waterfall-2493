class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])

    @movies = @studio.movies

    @actors = Actor.joins(:movies).where('')
  end
end
