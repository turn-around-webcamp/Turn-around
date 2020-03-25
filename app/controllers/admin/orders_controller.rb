class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!
  def index
    @orders = Order.all.order(created_at: :desc)
    @orders = Order.all.page(params[:page]).per(15)
  end

  def show
    @order = Order.find(params[:id])
    # そのユーザーの注文全部にしたい
  end

  def create
    @order = Order.new(params[:id])
  end


  def update
    @order = Order.find(params[:id])
    # @order.status = false
    @order.update(order_params)
	  redirect_to admin_orders_path
  end


  private

  def order_params
    params.require(:order).permit(:postage, :charge, :status,:charge, :payment_method, :name_address, :address, :postal_code)
  end

end
