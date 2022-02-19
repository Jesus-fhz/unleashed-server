Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  get '/users/:id/pets' => 'users#show_owned_pets'
  get '/users/find/:lat/:lng' => 'users#show_nearby_walkers', constraints: { lat: /.*/, lng: /.*/ }
  get '/users/:id/walks' => 'users#show_user_walks'

  get '/pets/:id/walks' => 'pets#show_pet_walks'

  #Get the login token from Knock
  post 'user_token' => 'user_token#create'

  #User routes
  get '/users/current' => 'users#current'
  
  resources :pets
  resources :users
  resources :walks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
