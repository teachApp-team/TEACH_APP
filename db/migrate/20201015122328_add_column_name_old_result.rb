class AddColumnNameOldResult < ActiveRecord::Migration[5.2]
  def change
    add_reference :old_results, :old_word, foreign_key: true
    add_reference :old_results, :old_word_test, foreign_key: true
  end
end
