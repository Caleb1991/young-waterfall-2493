require 'rails_helper'

RSpec.describe Actor do
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
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
  end

  describe 'relationships' do
    it {should have_many(:actors_movies)}
    it {should have_many(:movies).through(:actors_movies)}
  end

  describe 'Class Methods' do
    describe '#actors_for_given_movie' do
      it 'returns all the actors that worked on given movie' do
        expect(Actor.actors_for_given_movie(@movie_2.id).first.name).to eq(@actor_1.name)
        expect(Actor.actors_for_given_movie(@movie_2.id).last.name).to eq(@actor_3.name)
      end
    end

    describe '#actors_by_studio_ordered_by_age_desc' do
      it 'shows actors whom worked with that studio through a given movie ordered by age descending' do
        expect(Actor.actors_by_studio_ordered_by_age_desc(@studio_1.id).first.name).to eq('Christopher Walken')
        expect(Actor.actors_by_studio_ordered_by_age_desc(@studio_1.id).last.name).to eq('Billy Dee Williams')
      end
    end
  end
end
