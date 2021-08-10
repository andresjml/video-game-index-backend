Game.destroy_all
Genre.destroy_all
Platform.destroy_all
GamePlatform.destroy_all

puts "seeding"

5.times do
    Genre.create(name: Faker::Game.genre)
end

10.times do
    Game.create(title:Faker::Game.title, description: Faker::Lorem.paragraph, genre_id:[1,2,3,4,5].sample)
end

4.times do
    Platform.create(name:Faker::Game.platform)
end


GamePlatform.create(game_id:1, platform_id:1)
GamePlatform.create(game_id:2, platform_id:1)
GamePlatform.create(game_id:3, platform_id:2)
GamePlatform.create(game_id:4, platform_id:2)
GamePlatform.create(game_id:5, platform_id:3)
GamePlatform.create(game_id:6, platform_id:3)
GamePlatform.create(game_id:7, platform_id:4)
GamePlatform.create(game_id:8, platform_id:4)
GamePlatform.create(game_id:9, platform_id:1)
GamePlatform.create(game_id:10, platform_id:1)
GamePlatform.create(game_id:1, platform_id:2)
GamePlatform.create(game_id:2, platform_id:2)
GamePlatform.create(game_id:3, platform_id:3)
GamePlatform.create(game_id:4, platform_id:3)
GamePlatform.create(game_id:5, platform_id:4)
GamePlatform.create(game_id:6, platform_id:4)
GamePlatform.create(game_id:7, platform_id:1)
GamePlatform.create(game_id:8, platform_id:1)
GamePlatform.create(game_id:9, platform_id:2)
GamePlatform.create(game_id:10, platform_id:2)

puts "seeding completed"