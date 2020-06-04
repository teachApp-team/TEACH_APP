class AddColumnDateToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :date, :date
  end
end
