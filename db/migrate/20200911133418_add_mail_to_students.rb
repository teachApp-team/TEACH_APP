class AddMailToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :mail, :string
  end
end
