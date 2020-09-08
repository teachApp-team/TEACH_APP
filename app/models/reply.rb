class Reply < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :question

  validates :content, presence: true
end
