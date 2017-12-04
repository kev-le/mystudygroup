class Document < ApplicationRecord
  belongs_to :group
  has_attached_file :file

  validates_attachment :file, :presence => true,
  :content_type => { :content_type => ["application/pdf","application/vnd.ms-excel",
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "text/plain",
             "image/jpg",
             "image/png",
             "image/jpeg"] },
  :size => { :in => 0..10000.kilobytes }
end
