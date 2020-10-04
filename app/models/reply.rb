class Reply < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :teacher
  belongs_to :student
  belongs_to :question

  validates :content, presence: true
end
