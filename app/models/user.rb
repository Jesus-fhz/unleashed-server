class User < ApplicationRecord

  has_many :pets
  has_many :walks # only for user_type: 'walker'

  enum user_type: { walker: 0, owner: 1 }
  
  USERTYPES = [:walker, :owner]

  validates :user_type, presence: true

  # FIXME: Ask Luke why the line below line does not work as intended. It should refer to usertypes variable above and validate entries on form submit. It just seems to make the DB not accept either owner or walker as an option anymore.
  # validates :user_type, inclusion: { in: User::USERTYPES }

  #TODO: convert the address entered to a geocode. 

  # def self.address_to_geocode address
  #   data = Geocoder.search(address).first.data
  #   lat = data.["lat"].to_f
  #   lng = data.["lng"].to_f
    
  #   # figure out how to update the values of the table row given the address. 
  #   # TODO: even figure out how to make it a constructor method. 
  # end
end