Rails.application.routes.draw do

  get '/users/:id/pets' => 'users#show_owned_pets'

  resources :pets
  resources :users
  resources :walks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
