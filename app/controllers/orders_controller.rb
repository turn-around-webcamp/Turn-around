class OrdersController < ApplicationController
  def new
  	 @order = Order.new
     @user = current_user
  end
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  def confirm
  	 @order = Order.new(order_params)
    if params[:select_address] == "myaddress"
       @order.neme_address = current_user.last_name_japanese+first_name_japanese
    elsif params[:select_address] == "deliveryaddress"
      address = current_user.delivery_addresses.find(params[:delivery_address][:id])
      @order.neme_address = address.name_address
    elsif params[:select_address] == "newaddress"
     
    end
  end

  def create
	   @order = Order.new(order_params)
     @order.save

     #form.hidden_field各３つ必要

	   redirect_to action: :finish
  end

  def finish
  end

  private
  def order_params
     params.require(:order).permit(:charge, :payment_method, :neme_address, :address, :postal_code)
  end

  def delivery_params
     params.require(:delivery_address).permit(:id)
  end
end