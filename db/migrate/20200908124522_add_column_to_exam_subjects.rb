class AddColumnToExamSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :exam_subjects, :score, :integer
    add_column :exam_subjects, :deviation, :float
    add_column :exam_subjects, :judge, :string
  end
end
