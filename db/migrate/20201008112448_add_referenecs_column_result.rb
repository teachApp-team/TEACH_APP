class AddReferenecsColumnResult < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :word_test, foreign_key: true
  end
end
