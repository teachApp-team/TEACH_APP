class Student < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader
  
  belongs_to :teacher, optional: true
  has_many :messages
  has_many :learning_histories
  has_many :tests
  has_many :events
end
