Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]
  resources :products

  root to: "products#home"
end
