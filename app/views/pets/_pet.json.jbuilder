json.extract! pet, :id, :user_id, :image, :name, :breed, :age, :is_male, :size, :desexed, :can_walk_offleash, :can_be_petted, :can_walk_with_other_dogs, :created_at, :updated_at
json.url pet_url(pet, format: :json)
