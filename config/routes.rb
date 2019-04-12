Rails.application.routes.draw do
  devise_for :vendors
  devise_for :admins
  devise_for :users
  resources :orders
  resources :products
  resources :user_products
  resources :vendor_products

  authenticated :vendor do
    get 'vendor_orders' => "vendor_dashboard#vendor_orders"
    get 'vendor_products_' => "vendor_dashboard#vendor_products"

  end


  authenticated :user do
    get 'user_orders' => "user_dashboard#user_orders"
    get 'user_products_' => "user_dashboard#user_products"
  end

  # resources :products do
  #   resources :user_products
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "user_products#new"

end
