class AddUserIdToUseraddress < ActiveRecord::Migration[5.0]
  def change
    add_column :useraddresses, :user_id, :integer
  end
end
