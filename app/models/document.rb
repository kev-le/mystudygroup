class Document < ApplicationRecord
  belongs_to :group
  has_attached_file :file

  do_not_validate_attachment_file_type :file
end
