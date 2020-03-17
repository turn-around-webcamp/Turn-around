Rails.application.routes.draw do
  devise_for :users
   root 'homes#top'

  resources :items,only: [:show,:index]
  resources :cart_items,only: [:index,:create,:update,:destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
