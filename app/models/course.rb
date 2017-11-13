class Course < ActiveRecord::Base
  has_many :enrollments
  validates :name, length: { minimum: 4 }, presence: true
end
