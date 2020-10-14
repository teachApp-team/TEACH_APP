class CreateOldWords < ActiveRecord::Migration[5.2]
  def change
    create_table :old_words do |t|
      t.string :name
      t.string :meaning
      t.string :kanji
      t.string :part
      t.references :old_wordbook, foreign_key: true

      t.timestamps
    end
  end
end
