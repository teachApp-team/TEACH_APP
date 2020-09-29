class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :learning_history, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
