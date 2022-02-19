class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :text
    remove_column :users, :password_digest, :text
  end
end
