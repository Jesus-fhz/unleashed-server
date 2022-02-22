json.extract! user, :id, :name, :user_type, :address, :is_available, :earnings, :latitude, :longitude, :created_at, :updated_at
json.url user_url(user, format: :json)
