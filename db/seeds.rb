Game.destroy_all
Genre.destroy_all


puts "seeding"

5.times do
    Genre.create(name: Faker::Game.genre)
end

10.times do
    Game.create(title:Faker::Game.title, description: Faker::Lorem.paragraph, genre_id:[1,2,3,4,5].sample)
end






puts "seeding completed."