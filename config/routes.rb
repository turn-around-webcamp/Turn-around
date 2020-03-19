Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  namespace :admin do#↓admin/~ のルートはこの中に作成
    root 'homes#top'
    resources :orders, only:[:index,:show,:update]
  end#↑admin/~ のルートはこの中に作成

get 'users/:id/leave' => 'users#leave'

  devise_for :users
   root 'homes#top'
  resources :delivery_addresses, only:[:new,:index,:edit,:create,:update,:destroy]
  resources :users, only:[:show,:edit,:update,:destroy]
  resources :items,only: [:show,:index]
  resources :cart_items,only: [:index,:create,:update,:destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :orders, only: [:show,:index,:new] do
  	   collection do
  	      get 'confirm'
  	   end
  end
end