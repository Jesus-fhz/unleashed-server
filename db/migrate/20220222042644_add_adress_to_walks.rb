class AddAdressToWalks < ActiveRecord::Migration[5.2]
  def change
    add_column :walks, :address, :string
  end
end
