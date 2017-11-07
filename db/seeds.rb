# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

# SEED ADMIN User
a1 = User.create("first_name" => "Admin",
              "last_name" => "Admin",
              "email" => "a@a.com",
              "role" => "admin",
              "password" => "123456",
              "password_confirmation" => "123456")

u1 = User.create("first_name" => "Bobby",
              "last_name" => "chan",
              "email" => "b@b.com",
              "role" => "user",
              "password" => "123456",
              "password_confirmation" => "123456")
