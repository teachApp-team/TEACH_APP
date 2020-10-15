class OldResult < ApplicationRecord
  belongs_to :student
  belongs_to :old_word
  belongs_to :old_word_test

  scope :corrects_count, -> { where(correct: true).length }
end
