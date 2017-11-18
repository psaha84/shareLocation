# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times { |i| User.create(email: "sample-email#{i+1}@gmail.com", username: "sampleUser#{i+1}", password: "111111", password_confirmation: "111111") }
