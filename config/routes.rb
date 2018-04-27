Rails.application.routes.draw do
  get 'baskets/create'

  devise_for :users
  resources :users, except: [:new, :create]
  resources :products
  resources :carts, only: :show

  get '/users/:id/products', to: 'users#products', as: 'user_products'
  post '/baskets', to: 'baskets#create'
  root 'products#home'
end
