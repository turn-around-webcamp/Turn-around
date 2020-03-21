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
        @user = User.find(params[:id])
        if  @user.update(user_params)
          redirect_to user_path(@user.id)
        else
          @user = User.find(params[:id])
        render "edit"
        end
    end

    private
    # def admin_user
    #     redirect_to(root_path) unless current_user.admin?
    # end
    
end
