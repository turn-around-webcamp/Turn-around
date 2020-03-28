class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc) #ページネーション設定
    @items = Item.all.page(params[:page]).per(9) #ページネーション設定
    @categories = Category.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @categories = Category.all
  end
end
