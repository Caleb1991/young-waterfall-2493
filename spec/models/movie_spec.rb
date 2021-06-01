require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:actors_movies)}
    it {should have_many(:actors).through(:actors_movies)}
  end
end
