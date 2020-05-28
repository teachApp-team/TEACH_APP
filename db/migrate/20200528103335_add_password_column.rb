class AddPasswordColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :password_digest, :string
    add_column :teachers, :image, :string
    add_column :students, :password_digest, :string
    add_column :students, :image, :string
  end
end
