class Admin::CategoriesController < ApplicationController
	#before_action :authenticate_admin!
	def index
		@category = Category.new
		@categories = Category.all
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)
		if @category.save
		   redirect_to admin_categories_path(@category.id)
		else
			render :index
	    end
	end

	def update
		@category = Category.find(params[:id])
		if params[:category][:status] == "false"
		   @category.status = false
			if @category.update(category_params)
			   redirect_to admin_categories_path
			else
			  @category = Category.find(params[:id])
			  render :index
			end
		else
			@category.update(category_params)
			redirect_to admin_categories_path
		end
	end

	private
	def category_params
		params.require(:category).permit(:name, :status)
	end
end