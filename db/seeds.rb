Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
ActorsMovie.destroy_all

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
