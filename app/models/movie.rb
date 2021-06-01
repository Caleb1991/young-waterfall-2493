class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre

  belongs_to :studio
  has_many :actors_movies
  has_many :actors, through: :actors_movies

  def self.movies_by_given_actor(actor_id)
    joins(:actors_movies).where('actor_id = ?', actor_id)
  end
end
