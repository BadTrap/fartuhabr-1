Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:show, :index]

  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
      resources :categories, except: [:show]
      resources :posts, except: [:show, :index]
      resources :pictures, only: [:create, :destroy]
  end
end
