class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart_items = current_user.cart_items.all
  end

  def create
    @item = Item.find(params[:item_id])
    @cart_item = current_user.cart_items.new(cart_item_params)
    @cart_item.item_id = @item.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    user = User.find(current_user.id)
    user.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def  cart_item_params
    params.require(:cart_item).permit(:total_volume)
  end
end
