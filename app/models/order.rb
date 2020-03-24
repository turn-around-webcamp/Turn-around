class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum payment_method:[:銀行振込,:クレジットカード]#支払い方法
  enum status:[:入金待ち,:入金確認,:制作中,:発送準備中,:発送済み]

  def order_total_volume
    order_items.sum(:volume)
  end
end


