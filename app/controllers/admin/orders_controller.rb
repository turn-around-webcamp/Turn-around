class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = @user.
    @orders = Order.all
    # そのユーザーの注文全部にしたい

  end

  def update

  end
end
