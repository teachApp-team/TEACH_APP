class Wordbook < ApplicationRecord
  has_many :words

  def levels
    words.pluck(:level).uniq!
  end
end
