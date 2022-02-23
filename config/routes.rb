Rails.application.routes.draw do

  get '/users/:id/pets' => 'users#show_owned_pets'
  get '/users/find/:lat/:lng' => 'users#show_nearby_walkers', constraints: { lat: /.*/, lng: /.*/ }
  get '/users/:id/walks' => 'users#show_user_walks'
  get '/users/:id/walks/accepted' => 'users#show_user_walks'
  get '/pets/:id/walks' => 'pets#show_pet_walks'

  get '/walks/pending/:lat/:lng' => 'walks#show_pending', constraints: { lat: /.*/, lng: /.*/ }
  patch '/walks/:id/accepts' => 'walks#walker_accepts'
  
  get '/walks/:id/walker/loc/' => 'walks#show_walker_loc'
  get '/walks/:id/owner/loc/' => 'walks#show_owner_loc'
  
  #Get the login token from Knock
  post 'user_token' => 'user_token#create'

  #User routes
  get '/users/current' => 'users#current'
  
  resources :pets
  resources :users
  resources :walks
  
end
