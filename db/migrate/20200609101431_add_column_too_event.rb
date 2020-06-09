class AddColumnTooEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :title, :string
    remove_column :events, :content, :string
  end
end
