class EditColumnUserTypeInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_type, :integer, :default => 0
  end
end
