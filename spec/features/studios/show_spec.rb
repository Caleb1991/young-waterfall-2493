require 'rails_helper'

RSpec.describe 'Studio Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Disney', location: 'Where Dreams go to Die')

    @movie_1 = Movie.create!(title: 'Toy Story', creation_year: 1998, genre: 'Animation', studio_id: @studio_2.id)
    @movie_2 = Movie.create!(title: 'Monsters Inc.', creation_year: 2000, genre: 'Animation', studio_id: @studio_2.id)
    @movie_3 = Movie.create!(title: 'Die Hard', creation_year: 1995, genre: 'Action', studio_id: @studio_1.id)
    @movie_4 = Movie.create!(title: 'Empire Strikes Back', creation_year: 1984, genre: 'Space Opera', studio_id: @studio_1.id)
    visit "/studios/#{@studio_2.id}"
  end

#   As a user,
# When I visit a studio show page
# And I see the titles of all of its movies

  it 'shows the studios name and location' do
    expect(page).to have_content(@studio_2.name)
    expect(page).to have_content(@studio_2.location)
    expect(page).to_not have_content(@studio_1.name)
    expect(page).to_not have_content(@studio_1.location)
  end

  it 'shows the titles for all its movies' do
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
    expect(page).to_not have_content(@movie_3.title)
  end
end
