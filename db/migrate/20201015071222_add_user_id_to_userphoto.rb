class AddUserIdToUserphoto < ActiveRecord::Migration[5.0]
  def change
    add_column :userphotos, :user_id, :integer
  end
end
