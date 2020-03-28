class Admin::OrderItemsController < ApplicationController
    def update
        order = Order.find(params[:order_id])
        order_item = order.order_items.find(params[:id])
        # binding.pry
        order_item.update(order_item_params)

        if  order_item.status == "製作中"
            order.update(status: "製作中")
            redirect_to admin_order_path(order)
        end
       if order.order_items.all? { |item| item.status == "製作完了"}
            # 全てが..制作完了になったら、↓にしたい。
            order.update(status: "発送準備中")
            redirect_to admin_order_path(order)
        end
    end

    private

    def order_item_params

        params.require(:order_item).permit(:status)

    end
end
