class Teacher < ApplicationRecord
  has_many :teachers
  has_many :messages
end
