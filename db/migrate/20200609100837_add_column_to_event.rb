class AddColumnToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :title, :string
    rename_column :events, :title, :description
    rename_column :events, :all_day, :allday
  end
end
