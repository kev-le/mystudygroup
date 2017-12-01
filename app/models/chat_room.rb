class ChatRoom < ApplicationRecord
  belongs_to :group
  has_many :messages, dependent: :destroy
end
