class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors_movies
  has_many :actors, through: :actors_movies

  def self.movies_by_given_actor(actor_id)
    joins(:actors_movies).where('actor_id = ?', actor_id)
  end
end
