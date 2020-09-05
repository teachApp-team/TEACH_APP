class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :subject
      t.integer :score
      t.float :deviation
      t.string :judge

      t.timestamps
    end
  end
end
