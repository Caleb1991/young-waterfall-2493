class Actor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates :currently_working, inclusion: [true, false]

  has_many :actors_movies
  has_many :movies, through: :actors_movies

  def self.actors_for_given_movie(movie_id)
    joins(:actors_movies).where('movie_id = ?', movie_id)
  end

  def self.actors_by_studio_ordered_by_age_desc(studio_id)
    joins(:movies).where('studio_id = ?', studio_id).distinct.order(age: :desc)
  end
end
