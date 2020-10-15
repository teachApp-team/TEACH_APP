class ChangeColumnNameOldResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :old_results, :word_id, :bigint
    remove_foreign_key :old_results, :word_tests
    remove_index :old_results, :word_test_id
    remove_reference :old_results, :word_test 
  end
end
