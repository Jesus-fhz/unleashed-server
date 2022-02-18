class User < ApplicationRecord

  enum :user_type, [:walker, :owner]

end