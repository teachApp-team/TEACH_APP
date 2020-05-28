class Student < ApplicationRecord
  has_secure_password
  
  belongs_to :teacher
  has_many :messages
  has_many :learning_histories
end
