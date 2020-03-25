class DeliveryAddressesController < ApplicationController
    #before_action :authenticate_user!
    def index
        @delivers = DeliveryAddress.all
        @deliver = DeliveryAddress.new
        @user = current_user

        # 順番が前後した時の影響は？
        # ※注意※Delivery_address.allと書かない。RoadErrorになる。
    end

    def create
        @deliver = DeliveryAddress.new(delivery_address_params)
        # ストロングパラメータも同時に定義してあげる事。NameErrorになる。
        @deliver.user_id = current_user.id
        @deliver.save
        redirect_to delivery_addresses_path
        # リダイレクト先未決定
    end
    def edit
        @deliver = DeliveryAddress.find(params[:id])
    end
    def update
        @deliver = DeliveryAddress.find(params[:id])
        # 下記if文を書かないとRoutingErrorが起き、更新できない。
        if @deliver.update(delivery_address_params)
        redirect_to delivery_addresses_path
        else
            render "edit"
        end
    end
    def destroy
        delivery = DeliveryAddress.find(params[:id])
        delivery.destroy
        redirect_to delivery_addresses_path
    end

    private
    def delivery_address_params
        params.require(:delivery_address).permit(:postal_code,:address,:name_address)
    end

end
