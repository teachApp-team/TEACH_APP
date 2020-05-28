class Student < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader

  belongs_to :teacher
  has_many :messages
  has_many :learning_histories
end
