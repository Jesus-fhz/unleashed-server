class User < ApplicationRecord

  enum :user_type, [:walker, :owner]

  #TODO: convert the address entered to a geocode. 

  def address_to_geocode
    # figure out how to update the values of the table row given the address. 
    # TODO: even figure out how to make it a constructor method. 
  end
end