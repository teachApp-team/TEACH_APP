class ChangeNameQuestionType < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :type, :category
  end
end
