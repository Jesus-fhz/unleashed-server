class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.string :breed
      t.integer :age
      t.boolean :is_male
      t.string :size
      t.boolean :desexed
      t.boolean :can_walk_offleash
      t.boolean :can_be_petted
      t.boolean :can_walk_with_other_dogs

      t.timestamps
    end
  end
end
