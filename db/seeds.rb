# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(u_name: "test1", email: "test.1@osu.edu", password: "test1pass", account_type:"admin", created_at: Date.new(2020,11,28).to_time.to_i, updated_at: Date.new(2020,11,29).to_time.to_i)