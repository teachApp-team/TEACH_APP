class Teacher < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader

  has_many :students
  has_many :messages
end
