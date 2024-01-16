Rails.application.routes.draw do
  get 'dog_breeds/new'
  get 'dog_breeds/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dog_breeds, only: [:new, :create]
  root 'dog_breeds#new'
end
