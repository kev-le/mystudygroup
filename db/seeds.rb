# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Course.destroy_all
Enrollment.destroy_all

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
#courses
c1 = Course.create("name" => "CMPT 276", "description" => "intro to software development")
c2 = Course.create("name" => "CMPT 218", "description" => "intro to web development")

# groups
g1 = Group.create("course_id" => c1.id, "name" => "A fun group!", "description" => "exciting group to study with! Come join!")

# enrollments
e1 = Enrollment.create("user_id" => a1.id, "course_id" => c1.id, "group_id" => g1.id)

e2 = Enrollment.create("user_id" => a1.id, "course_id" => c1.id)
e3 = Enrollment.create("user_id" => a1.id, "course_id" => c2.id)
