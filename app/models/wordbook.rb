class Wordbook < ApplicationRecord
  has_many :words

  def levels
    return [] if words.pluck(:level).blank?
    words.pluck(:level).uniq!
  end

  def leveling_words(level, limit)
    words.where(level: level).limit(limit)
  end
end
