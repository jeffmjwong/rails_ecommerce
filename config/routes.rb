Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create] do
    resources :carts, except: [:new, :create]
  end
  resources :products

  get 'users/:id/products', to: 'users#products', as: 'user_products'
  root 'products#home'
end
