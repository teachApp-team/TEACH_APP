class Wordbook < ApplicationRecord
  has_many :words

  # scope :recent, -> (count) { where() }

  def levels
    return [] if words.pluck(:level).blank?
    words.pluck(:level).uniq!
  end

  def leveling_words(level, limit)
    words.where(level: level).limit(limit)
  end

  def leveling_wrong_words(level, limit, count)
    words = self.leveling_words(level, 100).order("RAND()")
    if count.to_i < 3
      return_words = words.select do |w|
        w.wrong_count == count.to_i
      end
    else
      return_words = words.select do |w|
        w.wrong_count >= count.to_i
      end
    end
    return_words.first(limit)
  end

  def testabe_words(level, limit)
    words = self.leveling_words(level, limit.to_i).order("RAND()")
    format_testable(words)
  end

  def retestabe_words(level, limit, count)
    words = self.leveling_wrong_words(level, limit.to_i, count).shuffle
    format_testable(words)
  end

  private

  def format_testable(words) 
    return_words = []
    lev = words.first.level if words.first.present?
    words.each do |q|
      # c_words = words.where.not(id: q.id).order("RAND()").limit(3)
      c_words = Word.where(level: lev).where.not(id: q.id).order("RAND()").limit(3)
      break if c_words[2].nil?
      word = {
        q: q.english,
        q_id: q.id,
        q_part: q.part,
        q_wrong_count: q.wrong_count,
        c: [
          q.japanese,
          c_words[0].japanese,
          c_words[1].japanese,
          c_words[2].japanese,
        ]
      }
      return_words.push(word)
    end
    return_words
  end
end
# const quizSet = [
#     {q: 'Caluculation', c: ['計算', '耕作', '文化', '美学']},
#     {q: 'Biology', c: ['B0', 'B1', 'B2', 'B3']},
#     {q: 'Accumulation', c: ['C0', 'C1', 'C2', 'C3']},
#   ];