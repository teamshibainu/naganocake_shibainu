Rails.application.routes.draw do
  devise_for :members,:controllers => {
    :registrations => 'members/registrations',
     :sessions => 'members/sessions'
   }
  devise_for :admins,:controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  root to: "public/homes#top", as: "top"
  get "public/home/about" => "public/homes#about" ,as: "about"

  namespace :admin do
    get "home/top" => "homes#top", as: "top"
    resources :homes
    resources :genres, only:[:index,:create,:edit,:update,:destroy,:show]
    resources :members
    resources :orders
    resources :orders_details
    resources :products
  end

  namespace :public do
    put "/members/:id/hide" => "members#hide", as: 'members_hide'
    get "/members/:id/withdrawal" => "members#withdrawal", as: 'members_withdrawal'
    root to: "homes#top"
    resources :homes
    resources :cart_products, only:[:index, :create, :update, :destroy]
    resources :members
    resources :orders
    resources :products
    resources :receiveds
  end

end
