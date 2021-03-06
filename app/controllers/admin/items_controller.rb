class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all.order(created_at: :desc)
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item.id)
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if  @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to admin_item_path(@item.id)
    else
      render 'edit'
    end
  end

  private
  def  item_params
    params.require(:item).permit(:name,:text,:image,:status,:non_tax_price,:category_id)
  end
end
