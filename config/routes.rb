Rails.application.routes.draw do
  root 'home#index'

  resources :tweets, only: [:index]
end
