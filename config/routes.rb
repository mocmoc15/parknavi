Rails.application.routes.draw do
  devise_for :users
  root to: 'parks#index'
  resources :parks, only: [:index, :new, :create,:show] do
    resources :comments, only:  :create
  end
end
