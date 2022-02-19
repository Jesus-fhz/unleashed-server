class ChangeGeocodeLatToLatitudeAndGeocodeLngToLongitude < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :geocode_lat, :latitude
    rename_column :users, :geocode_lng, :longitude
    rename_column :walks, :geocode_lat, :latitude
    rename_column :walks, :geocode_lng, :longitude
  end
end
