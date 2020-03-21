class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # def self.total_price
  #   price = 0
  #   current_user.carts.each do |cart|
  #     price += cart.item.post_tax_price
  #   end
  #   return price
  # end
end

# Cart.total_price