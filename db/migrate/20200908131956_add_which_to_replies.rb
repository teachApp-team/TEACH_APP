class AddWhichToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :which, :string
  end
end
