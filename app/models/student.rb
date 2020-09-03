class Student < ApplicationRecord
  has_secure_password

  mount_uploader :image, ImageUploader
  
  belongs_to :teacher, optional: true
  has_many :messages
  has_many :learning_histories
  has_many :tests
  has_many :events

  def history_time_ary
    histories = self.learning_histories
    @history_time_ary = []
    sum = 0
    @temp_created = nil
    histories.each_with_index do |h, h_index|
      new_created_at = h.created_at.strftime("%Y年%m月%d日")
      sum = 0 if @temp_created != new_created_at
      @temp_created = new_created_at
      new_learning_time = h.learning_time.hour*60 + h.learning_time.min
      get_uniq_created_at.each_with_index do |t, i|
        if t == new_created_at
          sum += new_learning_time
          @history_time_ary[i] = sum
        end
      end
    end
    @history_time_ary.sort.reverse!
  end

  def get_uniq_created_at
    histories = self.learning_histories
    created_at_ary = histories.map { |h| h.created_at.strftime("%Y年%m月%d日") }
    created_at_ary.uniq.sort.reverse!
  end
end
