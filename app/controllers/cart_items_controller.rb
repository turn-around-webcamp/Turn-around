class CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all

  end
  def create
    @cart_item = Cart_item.new(cart_item_params)

  end
  def update
    @cart_item = Cart_item.find(params[:id])

  end
  def destroy
    @cart_item = Cart_item.find(params[:id])

  end
  def destroy_all
    @cart_items = Cart_item.all

  end

  private
  def  cart_item_params
    params.require(:cart_item).permite(:total_volume)
  end
end
