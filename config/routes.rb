Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
get 'users/:id/leave' => 'users#leave'

  devise_for :users
   root 'homes#top'

  resources :users, only:[:show,:edit,:update,:destroy]
  resources :items,only: [:show,:index]
  resources :cart_items,only: [:index,:create,:update,:destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :orders, only: [:show,:index,:new]

end
