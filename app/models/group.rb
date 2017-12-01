class Group < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpeg"
  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/jpg", "image/png"] }

  belongs_to :course
  has_many :enrollments
  has_one :chat_room
end
