class Student < ApplicationRecord
  belongs_to :teacher
  has_many :messages
  has_many :learning_histories
end
