class LearningHistory < ApplicationRecord
  belongs_to :student
  has_one :like
  has_one :liked_teacher, through: :like, source: :teacher
end
