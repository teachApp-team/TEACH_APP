class OldWord < ApplicationRecord
  belongs_to :old_wordbook
  has_many :old_results

  def wrong_count
    self.ord_results.where(correct: false).length
  end
end
