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
    choices1 = self.leveling_words(level, limit).order("RAND()").pluck(:japanese)
    choices2 = self.leveling_words(level, limit).order("RAND()").pluck(:japanese)
    choices3 = self.leveling_words(level, limit).order("RAND()").pluck(:japanese) 
    choices = choices1 + choices2 + choices3
    choices.shuffle
    index = 0
    c_words = words.map.with_index do |w, i|
      # shuffle_words = words.order("RAND()").limit(3)
      # shuffle_words = shuffle_words.map {|word| word.japanese}
      # shuffle_words.push(w.japanese)
      # shuffle_words.shuffle
      shuffle_words = [
        w.japanese,
        choices[index],
        choices[index+1],
        choices[index+2],
      ]
      index+= 3
      {
        q: w.english,
        q_id: w.id,
        c: [
          shuffle_words[0],
          shuffle_words[1],
          shuffle_words[2],
          shuffle_words[3],
        ]
      }
    end
    c_words.shuffle
  end
end
# const quizSet = [
#     {q: 'Caluculation', c: ['計算', '耕作', '文化', '美学']},
#     {q: 'Biology', c: ['B0', 'B1', 'B2', 'B3']},
#     {q: 'Accumulation', c: ['C0', 'C1', 'C2', 'C3']},
#   ];