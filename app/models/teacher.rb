class Teacher < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader

  has_many :students
  has_many :messages
  has_many :tests
  has_many :events
  has_many :exams
  has_many :replies

  has_many :liked_lhs, through: :likes, source: :learning_history
end

