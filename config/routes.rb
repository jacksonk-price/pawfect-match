Rails.application.routes.draw do
  resources :surveys, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "surveys#new"
end
