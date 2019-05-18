class AddUserIdToForm < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :user_id, :integer
  end
end
