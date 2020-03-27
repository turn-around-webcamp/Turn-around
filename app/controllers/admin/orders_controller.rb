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
    @order_items = @order.order_items
    @order.update(order_params)
    if  @order.status == "入金確認"
        @order_items.each do |item|
         item.update(status: "制作完了")
        end
    end
	  redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:postage, :charge, :status,:charge, :payment_method, :name_address, :address, :postal_code)
  end

end
