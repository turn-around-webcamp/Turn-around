class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all

  end
  def create
    @cart_item = CartItem.new(cart_item_params)

  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_item_path(@cart_item.id)
  end
  def destroy
    @cart_item = CartItem.find(params[:id])

  end
  def destroy_all
    @cart_items = CartItem.all

  end

  private
  def  cart_item_params
    params.require(:cart_item).permite(:total_volume)
  end
end
