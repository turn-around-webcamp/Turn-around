class Admin::UsersController < ApplicationController
    # berore_action :admin_user
    # 後ほど追加する（管理者権限）

    def index
        @users = User.all
    end

    private
    # def admin_user
    #     redirect_to(root_path) unless current_user.admin?
    # end
end
