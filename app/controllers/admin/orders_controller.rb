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
    @order_item = @order.order_items.find(params[:id])
    @order.update(order_params)
    if  @order.status == "入金確認"
    @order_item.update(status: "制作待ち")
	  redirect_to admin_order_path(@order)
  end

  end
  private

  def order_params
    params.require(:order).permit(:postage, :charge, :status,:charge, :payment_method, :name_address, :address, :postal_code)
  end

end
