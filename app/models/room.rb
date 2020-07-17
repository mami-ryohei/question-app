class Room < ApplicationRecord
  attachment :message_image
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
