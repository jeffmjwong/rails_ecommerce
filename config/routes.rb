Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create] do
    resources :products
  end

  root to: "users#index"
  get "/products", to: "products#index", as: "products_home_page"
end
