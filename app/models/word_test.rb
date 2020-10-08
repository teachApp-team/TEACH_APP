class WordTest < ApplicationRecord
  belongs_to :student
  has_many :results
end
