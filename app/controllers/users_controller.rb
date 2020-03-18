class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    @user.save
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to root_path
  end
  private
  def user_params
    params.require(:user).permit(:last_name_japanese, :first_name_japanese, :last_name_japanese, :last_name_japanese, :last_name_katakana, :first_name_katakana, :email, :postal_code, :address, :tel)
  end
end
# privateのpermitにカラム名を入れないと、編集した時に保存されない。