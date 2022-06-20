Rails.application.routes.draw do
  # get 'carts/show'
  # get 'products/index'
  # get 'products/new'
  # get 'products/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'products#index'
  resources :products
  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:create, :show, :destroy, :update]

  post '/cart_items/:id/add' => 'cart_items#add_quantity', as: 'cart_item_add'
  post '/cart_items/:id/reduce' => 'cart_items#reduce_quantity', as: 'cart_item_reduce'

end
