json.extract! user, :id, :name, :user_type, :address, :is_available, :earnings, :geocode_lat, :geocode_lng, :created_at, :updated_at
json.url user_url(user, format: :json)
