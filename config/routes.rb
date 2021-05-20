Rails.application.routes.draw do
 # devise_for :members,:controllers => {
  #  :registrations => 'members/registrations',
  #   :sessions => 'members/sessions'
  # }
  devise_for :admins,:controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  root to: "public/homes#top", as: "top"
  get "public/home/about" => "public/homes#about" ,as: "about"

  namespace :admin do
    get "home/top" => "homes#top", as: "top"
    resources :homes
    resources :genres
    resources :members
    resources :orders
    resources :orders_details
    resources :products
  end

  namespace :public do
    root to: "homes#top"
    resources :homes
    resources :cart_products
    resources :members
    resources :orders
    resources :products
    resources :receiveds
  end
 devise_for :members,:controllers => {
    :registrations => 'members/registrations',
    :sessions => 'members/sessions'
  }

end
