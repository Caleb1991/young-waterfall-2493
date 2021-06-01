require 'rails_helper'

RSpec.describe ActorsMovie do
  describe 'validations' do
    it {should validate_presence_of(:movie_id)}
    it {should validate_presence_of(:actor_id)}
  end
   
  describe 'relationships' do
    it {should belong_to(:actor)}
    it {should belong_to(:movie)}
  end
end
