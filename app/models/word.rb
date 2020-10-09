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

  def isCorrect?
    self.results.where(correct: true).present?
  end

  class << self
    def format_testabel
      c_words = []
      self.each_slice(4) do |w|
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
end
