class ActorsMovie < ApplicationRecord
  validates_presence_of :movie_id
  validates_presence_of :actor_id
  
  belongs_to :actor
  belongs_to :movie
end
