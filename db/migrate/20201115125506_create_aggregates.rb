class CreateAggregates < ActiveRecord::Migration[5.2]
  def up
    create_table :aggregates do |t|
      t.references :student, foreign_key: true
      t.references :wordbook, foreign_key: true
      t.boolean :is_level
      t.float :percentage
      t.string :level

      t.timestamps
    end
  end
  def down
    drop_table :aggregates
  end
end
