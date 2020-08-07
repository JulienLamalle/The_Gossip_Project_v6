Rails.application.routes.draw do

  root 'static_pages#index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

  resources :gossips
  resources :users
  resources :cities, only: [:show , :new]
  resources :gossips do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
end
