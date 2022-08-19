require "open-uri"
require 'faker'

puts "Cleaning db..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all


url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)

puts "Creating lists..."

16.times do
  List.create!(name: Faker::Emotion.adjective, image_url: Faker::LoremPixel.image(size: "200x250", is_gray: false, category: 'fashion'))
end
  
puts "Creating movies..."

movies['results'].each do |movie|
  Movie.create!( title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'] )
end

puts "Done !"
