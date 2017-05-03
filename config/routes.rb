Rails.application.routes.draw do 


  get 'items/:id/increase',to: 'items#increase', as: :increase_item
  get 'items/:id/decrease',to: 'items#decrease', as: :decrease_item
  
  resources :functions
  resources :printers
  resources :brands
  resources :models
  resources :cartridges
  resources :recharges
  resources :directions
  resources :departments
  resources :offices
  resources :purchases
  resources :orders
  resources :products
  resources :items
  resources :others

  root "others#index"

  get '/printers/:id/destroy', to: 'printers#destroy', as: :destroy_printer
  get '/brands/:id/destroy', to: 'brands#destroy', as: :destroy_brand
  get '/models/:id/destroy', to: 'models#destroy', as: :destroy_model
  get '/cartridges/:id/destroy', to: 'cartridges#destroy', as: :destroy_cartridge
  get '/purchases/:id/destroy', to: 'purchases#destroy', as: :destroy_purchase
  get '/orders/:id/destroy', to: 'orders#destroy', as: :destroy_order
  get '/products/:id/destroy', to: 'products#destroy', as: :destroy_product
  get '/items/:id/destroy', to: 'items#destroy', as: :destroy_item
  
  get '*path' => redirect('404.html')
end
