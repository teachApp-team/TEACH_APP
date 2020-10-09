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
    choice_words = self.leveling_words(level, limit.to_i*4).order("RAND()").pluck(:id)
    choice_words.shuffle
    c_words = []
    choice_words.each_slice(4) do |w|
      ws = Word.where(id: w)
      break if ws[3].nil?
      word = {
        q: ws.first.english,
        q_id: ws.first.id,
        q_part: ws.first.part,
        q_wrong_count: ws.first.wrong_count,
        c: [
          ws[0].japanese,
          ws[1].japanese,
          ws[2].japanese,
          ws[3].japanese,
        ]
      }
      c_words.push(word)
    end
    c_words
  end
end
# const quizSet = [
#     {q: 'Caluculation', c: ['計算', '耕作', '文化', '美学']},
#     {q: 'Biology', c: ['B0', 'B1', 'B2', 'B3']},
#     {q: 'Accumulation', c: ['C0', 'C1', 'C2', 'C3']},
#   ];