require 'rails_helper'

RSpec.describe ActorsMovie do
  describe 'relationships' do
    it {should belong_to(:actor)}
    it {should belong_to(:movie)}
  end
end
