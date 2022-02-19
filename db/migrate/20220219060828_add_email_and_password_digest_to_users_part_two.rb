class AddEmailAndPasswordDigestToUsersPartTwo < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :text
    add_column :users, :password_digest, :text
  end
end
