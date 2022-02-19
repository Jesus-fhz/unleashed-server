Rails.application.routes.draw do

  get '/users/:id/pets' => 'users#show_owned_pets'
  get '/users/find/:lat/:lng' => 'users#show_nearby_walkers'
  get '/users/:id/walks' => 'users#show_user_walks'

  get '/pets/:id/walks' => 'pets#show_pet_walks'
  
  resources :pets
  resources :users
  resources :walks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
