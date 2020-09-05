class AddCoumnToExams < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :student, null: false, foreign_key: true
    add_reference :exams, :teacher, null: false, foreign_key: true
  end
end
