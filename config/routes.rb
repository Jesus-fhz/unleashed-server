Rails.application.routes.draw do
  resources :pets
  resources :users
  resources :walks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
