Rails.application.routes.draw do
  resources :dog_breeds, only: [:index] do 
    collection do
      get :fetch_dog_info
    end
  end
  root 'dog_breeds#index'
end
