Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]
  resources :products
  resources :carts, only: :show

  get 'users/:id/products', to: 'users#products', as: 'user_products'
  root 'products#home'
end
