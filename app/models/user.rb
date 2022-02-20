class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  # User associations
  has_many :pets
  has_many :walks # only for user_type: 'walker'
  
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  # Enum settings for validation
  enum user_type: { walker: 0, owner: 1 }
  USERTYPES = [:walker, :owner]
  validates :user_type, presence: true

  # FIXME: Ask Luke why the line below line does not work as intended. It should refer to usertypes variable above and validate entries on form submit. It just seems to make the DB not accept either owner or walker as an option anymore.
  # validates :user_type, inclusion: { in: User::USERTYPES }

  
  # figure out how to update the values of the table row given the address. 
  def self.address_to_geocode address
    
    # data = Geocoder.search(address).first.data # Note: this line was producing imprecise coordinates
    key = 'AIzaSyAm7vYw4jkC7m9hbEKpMfFxjwLAOZgxwko'
    url_address = (address).gsub(' ', '+');
    url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{url_address}&key=#{key}");
    data = HTTParty.get(url)
    p coords = data["results"][0]["geometry"]["location"]

    return coords
    
  end
end