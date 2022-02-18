class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :user_type
      t.string :address
      t.boolean :is_available
      t.float :earnings
      t.float :geocode_lat
      t.float :geocode_lng

      t.timestamps
    end
  end
end
