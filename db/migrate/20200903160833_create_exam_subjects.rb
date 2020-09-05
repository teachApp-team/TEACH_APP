class CreateExamSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_subjects do |t|
      t.string :name
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
