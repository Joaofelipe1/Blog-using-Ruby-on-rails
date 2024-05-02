# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create!(email: "felipe@example.com",
  password: 'password',
  password_confirmation: 'password',
  admin: true)


  25.times do |i|
    post = Post.new
    post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
    post.body = Faker::Lorem.paragraph_by_chars(number: 1500)
    post.user = User.first
    begin
      post.thumbnail.attach(io: URI.open("https://picsum.photos/1920/1080"), filename: "#{i}_thumbnail.jpg")
      post.banner.attach(io: URI.open("https://picsum.photos/1920/1080"), filename: "#{i}_banner.jpg")
    rescue StandardError => e
      puts "Error fetching image for post #{i}: #{e.message}"
    end
      # Handle the error as needed
    post.save

end
