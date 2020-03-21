class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :category
  mount_uploader :image, ImagesUploader
  attachment :image, destroy: false

  def post_tax_price#税込価格を定義している
    non_tax_price*1.1
  end
  def total_price #合計金額を定義している
    item.sum(:post_tax_price)
  end
end
