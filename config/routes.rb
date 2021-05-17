Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :homes
    resources :genres
    resources :members
    resources :orders
    resources :orders_details
    resources :products
  end

  namespace :public do
    resources :homes
    resources :cart_products
    resources :members
    resources :orders
    resources :products
    resources :receiveds
  end


end
