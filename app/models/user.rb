class User < ApplicationRecord

  enum :user_type, [:walker, :owner]

  #TODO: convert the address entered to a geocode. 

  def self.address_to_geocode address
    data = Geocoder.search(address).first.data
    lat = data.["lat"].to_f
    lng = data.["lng"].to_f
    
    
    # figure out how to update the values of the table row given the address. 
    # TODO: even figure out how to make it a constructor method. 
  end
end