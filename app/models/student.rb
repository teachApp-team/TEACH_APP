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
end
