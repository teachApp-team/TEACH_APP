class Teacher < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader

  has_many :teachers
  has_many :messages
end
