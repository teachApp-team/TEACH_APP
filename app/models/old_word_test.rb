class OldWordTest < ApplicationRecord
  belongs_to :student
  has_many :old_results
end
