Rails.application.routes.draw do
  resources :migrations
  resources :order_items
  resources :carts
  resources :deliveries do
    post :my_order, on: :member 
  end
  resources :comments
  resources :orders do
    post :my_create, on: :member
  end
  resources :riders
  resources :buyers
  resources :items
  resources :sellers
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "welcome#index"
end
