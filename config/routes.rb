Rails.application.routes.draw do
  get 'survey_results/show'
  resources :surveys, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "surveys#new"
end
