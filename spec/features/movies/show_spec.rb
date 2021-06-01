require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Disney', location: 'Where Dreams go to Die')

    @movie_1 = Movie.create!(title: 'Toy Story', creation_year: 1998, genre: 'Animation', studio_id: @studio_2.id)
    @movie_2 = Movie.create!(title: 'Monsters Inc.', creation_year: 2000, genre: 'Animation', studio_id: @studio_2.id)
    @movie_3 = Movie.create!(title: 'Die Hard', creation_year: 1995, genre: 'Action', studio_id: @studio_1.id)
    @movie_4 = Movie.create!(title: 'Empire Strikes Back', creation_year: 1984, genre: 'Space Opera', studio_id: @studio_1.id)

    @actor_1 = Actor.create!(name: 'Matt Smith', age: 30, currently_working: true)
    @actor_2 = Actor.create!(name: 'Billy Dee Williams', age: 72, currently_working: true)
    @actor_3 = Actor.create!(name: 'Christopher Walken', age: 80, currently_working: false)
    @actor_4 = Actor.create!(name: 'Matt Damon', age: 40, currently_working: true)

    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_3.id, movie_id: @movie_2.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_1.id, movie_id: @movie_2.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_2.id, movie_id: @movie_3.id)
    @actor_movies_1 = ActorsMovie.create!(actor_id: @actor_3.id, movie_id: @movie_3.id)

    visit "/movies/#{@movie_3.id}"
  end

  it 'Shows the movies attributes' do
    expect(page).to have_content(@movie_3.title)
    expect(page).to have_content(@movie_3.creation_year)
    expect(page).to have_content(@movie_3.genre)
  end

  it 'Shows all the actors for the given movie and doesnt show actors not associated with the given movie' do
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to_not have_content(@actor_1.name)
  end

#   As a user,
# When I visit a movie show page,
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed

  it 'has a form to add an actor' do
    expect(page).to have_content('Name')
  end

  it 'returns to movie show page and shows results for searched actor' do
    fill_in :name, with: 'Matt Smith'
    click_on 'Search for Actor'

    expect(current_path).to eq("/movies/#{@movie_3.id}")
    expect(page).to have_content('Matt Smith')
  end
end
