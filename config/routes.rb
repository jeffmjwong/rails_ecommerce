Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create] do
    get '/cart', to: 'carts#index', as: 'user_cart'
    get '/cart/edit', to: 'carts#edit', as: 'edit_user_cart'
    patch '/cart', to: 'carts#update'
    put '/cart', to: 'carts#update'
  end
  resources :products

  get 'users/:id/products', to: 'users#products', as: 'user_products'
  root 'products#home'
end
