Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  namespace :admin do#↓admin/~ のルートはこの中に作成
    root 'homes#top'
    resources :orders, only:[:index,:show,:update] do
      resources :order_items, only:[:update]
    end
    resources :users, only:[:index,:show,:edit,:update]
    resources :categories, only: [:edit, :create, :index, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end#↑admin/~ のルートはこの中に作成

  devise_for :users
   root 'homes#top'
  resources :delivery_addresses, only:[:new,:index,:edit,:create,:update,:destroy]
  resources :users, only:[:show,:edit,:update,:destroy] do
    member do
      get 'leave'
    end
  end
  resources :items,only: [:show,:index] do
    resources :cart_items,only: [:create,:update,:destroy]
  end
  resources :cart_items,only: [:index]

  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

  resources :orders, only: [:show,:index, :new, :create] do
    # order_itemも中に入る？postcommentのようなイメージ？
    resources :order_item, only: [:create, :destroy]
  	   collection do
  	      post 'confirm'
  	      get 'finish'
        end
  end
end