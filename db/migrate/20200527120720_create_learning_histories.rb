class CreateLearningHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_histories do |t|
      t.time :learning_time
      t.string :learning_text
      t.text :comment
      t.string :subject
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
