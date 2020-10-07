class Wordbook < ApplicationRecord
  has_many :words

  def levels
    return [] if words.pluck(:level).blank?
    words.pluck(:level).uniq!
  end

  def leveling_words(level, limit)
    words.where(level: level).limit(limit)
  end

  def testabe_words(level, limit)
    words = self.leveling_words(level, limit)
    c_words = words.map do |w|
      shuffle_words = words.order("RAND()").limit(3)
      shuffle_words = shuffle_words.map {|word| word.japanese}
      shuffle_words.push(w.japanese)
      shuffle_words.shuffle
      {
        q: w.english,
        c: [
          shuffle_words[0],
          shuffle_words[1],
          shuffle_words[2],
          shuffle_words[3],
        ]
      }
    end
    c_words
  end
end
# const quizSet = [
#     {q: 'Caluculation', c: ['計算', '耕作', '文化', '美学']},
#     {q: 'Biology', c: ['B0', 'B1', 'B2', 'B3']},
#     {q: 'Accumulation', c: ['C0', 'C1', 'C2', 'C3']},
#   ];