class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @users = User.with_deleted
    end

    def show
        @user = User.with_deleted.find(params[:id])
    end

    def edit
        @user = User.with_deleted.find(params[:id])
    end


    def update
        @user = User.with_deleted.find(params[:id])
        if params[:user][:status] == false
            # params[:status]だと中身がnilと判明(binding.pryを用いた)
            # ユーザーテーブルの中のステータスカラムを作っているから上記の書き方になる。（入れ子になっている）
            @user.status = false
            # ステータスにfalseを入れる
            if  @user.update(user_params)
                @user.destroy
                redirect_to admin_users_path
            else
                render "edit"
            end
        else
            @user.update(user_params)
            redirect_to admin_users_path
        end
    end

    private
    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end
    def user_params
        params.require(:user).permit(:last_name_japanese, :first_name_japanese, :last_name_japanese, :last_name_japanese, :last_name_katakana, :first_name_katakana, :postal_code, :address, :tel, :email, :status)
    end

end
