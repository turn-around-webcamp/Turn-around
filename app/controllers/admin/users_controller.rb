class Admin::UsersController < ApplicationController
    # berore_action :admin_user
    # 後ほど追加する（管理者権限）

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end


    def update
        # binding.pry
        @user = User.find(params[:id])
        if  @user.update(user_params)
            redirect_to admin_user_path(current_admin.id)
        else
            @user = User.find(params[:id])
            render "edit"
        end
    end

    private
    # 後ほど追加する（管理者権限）
    # def admin_user
    #     redirect_to(root_path) unless current_user.admin?
    # end
    def user_params
        params.require(:user).permit(:last_name_japanese, :first_name_japanese, :last_name_japanese, :last_name_japanese, :last_name_katakana, :first_name_katakana, :postal_code, :address, :tel, :email)
    end
    # statusを追加する
end
