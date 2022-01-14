Rails.application.routes.draw do
  devise_for :users
  root to: 'parks#index'
  resources :parks, only: [:index, :new, :create]
end
