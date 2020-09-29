class Like < ApplicationRecord
  belongs_to :learning_history
  belongs_to :teacher

  validates_uniqueness_of :learning_history_id, scope: :teacher_id
end
