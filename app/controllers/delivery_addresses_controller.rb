class DeliveryAddressesController < ApplicationController
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
    end
    def edit
        @deliver = DeliveryAddress.find(params[:id])
    end
    def update
    end
    def destroy
    end

    private
    def delivery_address_params
        params.require(:delivery_address).permit(:postal_code,:address,:name_address)
    end
end
