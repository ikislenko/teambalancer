# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Task.delete_all

10.times do
     User.create(
        name: FFaker::Name.first_name,
        story_points: 40
      )
end


50.times do
     Task.create(
        title: FFaker::Lorem.phrase,
        story_points: Random.rand(15)
      )
end
