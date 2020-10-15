class CreateUseraddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :useraddresses do |t|
      t.string :houseno
      t.string :street
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
