Rails.application.routes.draw do
  devise_for :vendors
  devise_for :admins
  devise_for :users
  resources :orders
  resources :products
  resources :user_products
  resources :vendor_products

  get 'vendor_orders' => "vendor_dashboard#vendor_orders"

  # resources :products do
  #   resources :user_products
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user_products#new"

end
