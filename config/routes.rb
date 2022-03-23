Rails.application.routes.draw do
  resources :physics_bodies
  resources :universes
  resources :simulations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
