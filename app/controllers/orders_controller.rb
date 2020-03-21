class OrdersController < ApplicationController
  def new
  	 @order = Order.new
     @user = current_user
  end
  
  def index
    #@orders = Order.all
  end

  def show
    #@order = Order.find(params[:id])
  end
  def confirm
  	 @order = Order.new(order_params)
  end

  def create
	   @order = Order.new(order_params)
     @order.save
	   redirect_to action: :finish
  end

  def finish
  end

  private
  def order_params
     params.require(:order).permit(:postage, :charge, :payment_method, :neme_address, :address, :postal_code)
  end
end