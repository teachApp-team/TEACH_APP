class Word < ApplicationRecord
  belongs_to :wordbook

  validates :english, presence: true, uniqueness: true
  validates :japanese, presence: true
  validates :part, presence: true
  validates :level, presence: true
end
