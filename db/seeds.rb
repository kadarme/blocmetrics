require 'faker'

# Create Users
5.times do
  user = User.new(
  name:        Faker::Name.name,
  email:       Faker::Internet.email,
  password:    Faker::Lorem.characters(10)
  ) 
user.skip_confirmation!
user.save!
end  
users = User.all

# Create a member
member = User.new(
  name:        'Member User',
  email:       'member@example.com',
  password:    'helloworld'
  )
member.skip_confirmation!
member.save!

# Create registered applications
example_app = RegisteredApplication.create!(
  user:        member,
  name:        'Example Name',
  url:         'http://example.com'
  )
example_app.save!

5.times do
  registered_application = RegisteredApplication.create!(
  user:        member,
  name:        Faker::App.name,
  url:         Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all


 
puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
