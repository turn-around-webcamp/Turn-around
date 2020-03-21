class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :category
  mount_uploader :image, ImagesUploader
end
