class Result < ApplicationRecord
  belongs_to :student
  belongs_to :word
  belongs_to :word_test

  scope :corrects_count, -> { where(correct: true).length }
end
