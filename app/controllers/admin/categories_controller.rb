class Admin::CategoriesController < ApplicationController
	def index
		@category = Category.new
		@categories = Category.all
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
	end

	def update
	end
end
