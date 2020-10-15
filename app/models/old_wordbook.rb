class OldWordbook < ApplicationRecord
  has_many :old_words
  
  def test_words(limit)
    words = old_words.select('old_words.*', 'count(old_results.id) AS results')
    .left_joins(:old_results)
    .group('old_words.id')
    .order('results asc').limit(limit)
    format_testable(words)
  end

  private

  def format_testable(words) 
    return_words = []
    words.each do |q|
      c_words = OldWord.where(part: q.part).where.not(id: q.id).order("RAND()").limit(3)
      break if c_words[2].nil?
      word = {
        q: q.name,
        q_id: q.id,
        q_part: q.part,
        q_kanji: q.kanji,
        q_wrong_count: q.wrong_count,
        c: [
          q.meaning,
          c_words[0].meaning,
          c_words[1].meaning,
          c_words[2].meaning,
        ]
      }
      return_words.push(word)
    end
    return_words
  end
end
