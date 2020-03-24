class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    # そのユーザーの注文全部にしたい
  end

  def create
    @order = Order.new(params[:id])
  end


  def update
    @order = Order.find(params[:id])
    # if params[:order][:status] ==
    @order.update(order_params)
	  redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end

