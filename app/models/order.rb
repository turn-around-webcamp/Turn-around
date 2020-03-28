class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum payment_method:[:銀行振込,:クレジットカード]#支払い方法
  enum status:[:入金待ち,:入金確認,:製作中,:発送準備中,:発送済み]

  def order_total_volume
    order_items.sum(:volume)
  end

  def get_total_price #何をするかを命名
    total_price = 0
    self.order_items.each do |order_item|
      total_price += order_item.price.to_i * order_item.volume.to_i
    end
    return total_price
  end

end