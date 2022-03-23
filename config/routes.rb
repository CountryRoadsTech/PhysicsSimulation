# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Create RESTful routes for scaffolds:
  resources :physics_bodies
  resources :universes
  resources :simulations

  # Defines the root path route ("/")
  root "simulations#index"
end
