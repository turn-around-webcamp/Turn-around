class Admin::HomesController < ApplicationController
  def top
    @order = Order.count
  end
end
