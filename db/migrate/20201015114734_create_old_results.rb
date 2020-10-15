class CreateOldResults < ActiveRecord::Migration[5.2]
  def change
    create_table :old_results do |t|
      t.references :student, foreign_key: true
      t.references :word, foreign_key: true
      t.boolean :correct
      t.references :word_test, foreign_key: true

      t.timestamps
    end
  end
end
