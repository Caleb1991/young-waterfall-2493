require 'rails_helper'

RSpec.describe 'Studio Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Disney', location: 'Where Dreams go to Die')

    @movie_1 = Movie.create!(title: 'Toy Story', creation_year: 1998, genre: 'Animation', studio_id: @studio_2.id)
    @movie_2 = Movie.create!(title: 'Monsters Inc.', creation_year: 2000, genre: 'Animation', studio_id: @studio_2.id)
    @movie_3 = Movie.create!(title: 'Die Hard', creation_year: 1995, genre: 'Action', studio_id: @studio_1.id)
    @movie_4 = Movie.create!(title: 'Empire Strikes Back', creation_year: 1984, genre: 'Space Opera', studio_id: @studio_1.id)

    @actor_1 = Actor.create!(name: 'Matt Smith', age: 30, currently_working: true)
    @actor_2 = Actor.create!(name: 'Billy Dee Williams', age: 72, currently_working: false)
    @actor_3 = Actor.create!(name: 'Christopher Walken', age: 80, currently_working: true)

    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_2.id, movie_id: @movie_2.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_1.id, movie_id: @movie_2.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_2.id, movie_id: @movie_3.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_3.id, movie_id: @movie_3.id)

    visit "/studios/#{@studio_2.id}"
  end

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

#   As a user,
# When I visit a studio show page
# I see a list of actors that have acted in any of the studio's movies
# And I see that the list of actors is unique (no duplicate actors)
# And I see that the list of actors is ordered from oldest actor to youngest
# And I see that the list of actors only includes actors that are currently working

  it 'shows actors that have acted in any of their movies' do
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).to_not have_content(@actor_3.name)
  end
end
