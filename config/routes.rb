Rails.application.routes.draw do
  devise_for :users
  root to: 'parks#index'
  resources :parks, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only:  :create
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
      get 'map'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    resources :favorites 
  end
end
