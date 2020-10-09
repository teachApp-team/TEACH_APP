class Word < ApplicationRecord
  belongs_to :wordbook
  has_many :results

  validates :english, presence: true, uniqueness: true
  validates :japanese, presence: true
  validates :part, presence: true
  validates :level, presence: true

  def wrong_count
    self.results.where(correct: false).length
  end
end
