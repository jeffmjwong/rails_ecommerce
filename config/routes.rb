Rails.application.routes.draw do
  resources :carts
  devise_for :users
  resources :users, except: [:new, :create]
  resources :products

  get 'users/:id/products', to: 'users#products', as: 'user_products'
  root 'products#home'
end
