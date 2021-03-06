# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 require 'random_data'

 5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
   )
 end
 users = User.all
 
 15.times do
  Topic.create!(
   name:        RandomData.random_sentence,
   description: RandomData.random_paragraph
   )
 end
 topics = Topic.all 
 
#  50.times do
#   SponsoredPost.create!(
#   title:     RandomData.random_sentence,
#   body:      RandomData.random_paragraph,
#   price:     RandomData.random_number
#   )
#  end
#  sponsored_posts = SponsoredPost.all
  

 # Create Posts
 50.times do
 # #1
   post = Post.create!(
 # #2
     user: users.sample,
     topic: topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
   post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
   rand(1..5).times {post.votes.create!(value:[-1, 1].sample, user: users.sample)}
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     user: users.sample,
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
puts "#{Post.count}"
Post.find_or_create_by(title: "This is my title", body: "This is my body")
puts "#{Post.count}"
 
# Create an admin user
admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
)

# Create a member
member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
)

# Create a moderator
moderator = User.create!(
    name:     'Moderator User',
    email:    'checks91@gmail.com',
    password: 'helloworld',
    role:     'moderator'
)
puts "#{moderator.email}"
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
# puts "#{SponsoredPost.count} sponsored posts created"