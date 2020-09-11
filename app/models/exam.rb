class Exam < ApplicationRecord
  has_many :exam_subjects

  accepts_nested_attributes_for :exam_subjects, allow_destroy: true
end
