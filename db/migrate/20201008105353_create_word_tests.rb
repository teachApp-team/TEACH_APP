class CreateWordTests < ActiveRecord::Migration[5.2]
  def change
    create_table :word_tests do |t|
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
