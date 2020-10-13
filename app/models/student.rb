class Student < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader
  
  belongs_to :teacher, optional: true
  has_many :messages
  has_many :learning_histories
  has_many :tests
  has_many :events
  has_many :exams
  has_many :replies
  has_many :results
  has_many :word_tests

  def history_time_ary
    histories = self.learning_histories
    result_ary = []
    get_uniq_created_at.each_with_index do |created_at, created_i|
      today_all_histories = self.learning_histories.where(created_at: created_at.in_time_zone.all_day)
      next if today_all_histories.nil?
      today_all_times = today_all_histories.map {|h| new_learning_time = h.learning_time.hour*60 + h.learning_time.min }
      result_ary << [created_at, today_all_times.sum]
    end
    result_ary
  end

  def get_uniq_created_at
    histories = self.learning_histories
    created_at_ary = histories.map { |h| h.created_at.strftime("%Y/%m/%d") }
    # created_at_ary = self.learning_histories.pluck(:created_at)
    created_at_ary.uniq.sort.reverse!
  end

  def solved_results(book_id, level)
    results.select { |result| result.word.wordbook_id == book_id && result.word.level == level }
  end

  def correct_percentage(book_id, level)
    solved_results = self.solved_results(book_id, level)
    correct_results = solved_results.select { |result| result.correct }
    if solved_results.present?
      (correct_results.length.to_f / solved_results.length.to_f * 100).round(1)
    else
      0
    end
  end

  def last_solved_at(book_id, level)
    solved_results = self.solved_results(book_id, level)
    if solved_results.present?
      solved_results.last.created_at.strftime("%Y/%m/%d")
    else
      "未受験"
    end
  end
  def corrects_of_book(book_id)
    results.where(correct: true).select do |result|
      result.word.wordbook_id == book_id
    end
  end
  def corrects_of_level(level)
    results.where(correct: true).select do |result|
      result.word.level == level
    end
  end
end
