class CreateUserphotos < ActiveRecord::Migration[5.0]
  def change
    create_table :userphotos do |t|
      t.string :attachment

      t.timestamps
    end
  end
end
