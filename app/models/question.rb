class Question < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  has_many :replies

  mount_uploader :image, ImageUploader

  validates :content, presence: true
  validates :category, presence: true
end
