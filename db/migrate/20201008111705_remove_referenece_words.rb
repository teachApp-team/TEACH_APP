class RemoveRefereneceWords < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :words, :word_tests
    remove_index :words, :word_test_id
    remove_reference :words, :word_test
  end
end
