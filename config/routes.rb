Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, except: [:new, :create]
  resources :products do
    post '/reviews', to: 'reviews#create'
  end
  resources :carts, only: :show

  post '/charge', to: 'charges#one', as: 'charge'
  post '/charges', to: 'charges#multiple', as: 'charges'
  get '/users/:id/user_shop', to: 'users#user_shop', as: 'user_shop'
  post '/baskets', to: 'baskets#create'
  patch '/baskets', to: 'baskets#update'
  put '/baskets', to: 'baskets#update'
  delete '/baskets', to: 'baskets#destroy'
  delete '/review', to: 'reviews#destroy'

  root 'products#home'
end
