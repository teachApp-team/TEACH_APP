class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :school_of_choice
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
