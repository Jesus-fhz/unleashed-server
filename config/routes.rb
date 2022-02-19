Rails.application.routes.draw do

  get '/users/:id/pets' => 'users#show_owned_pets'
  get '/users/find/:lat/:lng' => 'users#show_nearby_walkers'
  get '/users/:id/walks' => 'users#show_user_walks'

  get '/pets/:id/walks' => 'pets#show_pet_walks'
  
  #Get the login token from Knock
  post 'user_token' => 'user_token#create'

  #User routes
  get '/users/current' => 'users#current'
  
  resources :pets
  resources :users
  resources :walks

end
