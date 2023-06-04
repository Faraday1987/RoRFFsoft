Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/profile', to: 'profile#index'
  get '/settings', to: 'profile#settings'
  get '/settings', to: 'profile#settings'
  # Rutas para la sección de categorías
  resources :categories
  resources :sales
  resources :products
  resources :clients
  resources :suppliers
  resources :warehouse_records
  post 'add_item_venta', to: 'sales#add_item'
  post 'remove_item_venta', to: 'sales#remove_item'
  # get '/buscador_productos', to: 'products#index', as: 'buscador_productos'

  # delete '/categories/:id', to: 'categories#destroy', as: :delete_category
  # post '/categories', to: 'categories#create'
  # patch '/category/:id', to: 'categories#update', as: :update_category
  # get '/categories', to: 'categories#index'
  # get '/categories/new', to: 'categories#new', as: :new_category
  # get '/categories/:id/edit', to: 'categories#edit', as: :edit_category
  # get '/category/:id', to: 'categories#show', as: :category

end