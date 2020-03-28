class HomesController < ApplicationController
	def top
    @items = Item.all.order(created_at: :desc)
    @items = Item.all.page(params[:page]).per(4)
    @categories = Category.all
	end
end
