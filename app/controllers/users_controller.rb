class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def leave
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.status = false
    @user.update(delete_params)
    # アドミンと同様に
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:last_name_japanese, :first_name_japanese, :last_name_japanese, :last_name_japanese, :last_name_katakana, :first_name_katakana, :email, :postal_code, :address, :tel, :status)
  # ユーザーの中のカラム名
  end

  def delete_params
    params.permit(:last_name_japanese, :first_name_japanese, :last_name_japanese, :last_name_japanese, :last_name_katakana, :first_name_katakana, :email, :postal_code, :address, :tel, :status)
  end
  # ユーザーパラムスがそもそも表示されていない

end
# privateのpermitにカラム名を入れないと、編集した時に保存されない。