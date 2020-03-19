class OrdersController < ApplicationController
  def new
  	 @order = Order.new
  end
  
  def index
    #@orders = Order.all
  end

  def show
    #@order = Order.find(params[:id])
  end
  def confirm
  	 @order = Order.new
  end

  def create
	    @order = Order.new
		redirect_to action: :finish
  end
end