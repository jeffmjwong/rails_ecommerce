Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create] do
    resources :products
  end

  root to: "products#home"
  get "/products", to: "products#home", as: "products_home_page"
end
