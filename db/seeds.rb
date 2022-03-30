# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    def create_user_data(user)
        profile = Profile.create(name: Faker::Name.name, username: Faker::Internet.user_name, bio: Faker::Lorem.paragraph, user: user, avatar: Faker::Avatar.image)
        rand(3..10).times do
            post = Post.create(content: Faker::TvShows::Simpsons.quote, user: user)
            rand(2..5).times do
                commment = Comment.create(content: Faker::Restaurant.review, user: user, post: post)
            end
        end
    end

    15.times do
        password = Faker::Internet.password
        user = User.create(email: Faker::Internet.email, password: password, password_confirmation: password)
        create_user_data(user)
    end

    # Create an admin user
    admin = User.create(
        email: 'doniben6@gmail.com',
        password: 'password',
        password_confirmation: 'password')

    create_user_data(admin)
        

    


