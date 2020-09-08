class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :content
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
