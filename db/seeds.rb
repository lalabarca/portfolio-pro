# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ProjectSkill.destroy_all
Project.destroy_all
Skill.destroy_all
puts "Creating user"
User.create!(email: "laura.hardydes@gmail.com", password: "myStuff22", admin: true)
puts "Creating skills"
titles = %w(HTML/Scss Javascript Ruby Rails Photoshop Figma Adobe\ XD Illustrator UI\ Design Google\ Maps\ Api Stimulus\ JS)

titles.each do |t|
  Skill.create!(title: t, rating: (1..3).to_a.sample)
end

puts "Finished"
