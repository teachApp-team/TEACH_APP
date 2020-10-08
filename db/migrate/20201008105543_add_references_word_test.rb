class AddReferencesWordTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :words, :word_test, foreign_key: true
  end
end
