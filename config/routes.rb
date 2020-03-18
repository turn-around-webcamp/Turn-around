Rails.application.routes.draw do

get 'users/:id/leave' => 'users#leave'

  devise_for :users
   root 'homes#top'

  resources :users, only:[:show,:edit,:update,:destroy]
  resources :items,only: [:show,:index]
  resources :cart_items,only: [:index,:create,:update,:destroy]
  delete 'cart_items' => 'cart_items#destroy_all'

end
