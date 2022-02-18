class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
      t.integer :pet_id
      t.integer :user_id
      t.integer :status, default: 0
      t.float :cost
      t.float :duration
      t.float :geocode_lat
      t.float :geocode_lng
      t.text :special_instruction

      t.timestamps
    end
  end
end