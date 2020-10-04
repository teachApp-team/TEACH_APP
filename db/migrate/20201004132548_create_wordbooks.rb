class CreateWordbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :wordbooks do |t|
      t.string :name

      t.timestamps
    end
  end
end
