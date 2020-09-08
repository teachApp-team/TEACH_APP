class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
