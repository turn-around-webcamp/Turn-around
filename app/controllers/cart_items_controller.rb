class CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items.all
  end
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to new_order_path(@cart_item.id)
  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_item_path(@cart_item.id)
  end
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: cart_items_path)
  end
  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_back(fallback_location: cart_items_path)
  end

  private
  def  cart_item_params
    params.require(:cart_item).permite(:total_volume)
  end
end
