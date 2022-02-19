class Pet < ApplicationRecord

  belongs_to :user, optional: true
  has_many :walks

end
