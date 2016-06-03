Rails.application.routes.draw do
  root 'tweets#index'

  resources :tweets, only: [:index] do
    get :search, on: :collection
    get :mentionners, on: :collection
  end
end
