class OldWord < ApplicationRecord
  belongs_to :old_wordbook
  has_many :old_results
end
