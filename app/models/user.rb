class User < ApplicationRecord
  acts_as_paranoid

  has_many :delivery_addresses
  has_many :cart_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         def full_name_japanese
          last_name_japanese+first_name_japanese
         end
         def full_name_katakana
          last_name_katakana+first_name_katakana
         end
  def total_price
    price = 0
    self.cart_items.each do |cart|
      puts cart_items[0]
      price += cart.item.post_tax_price*cart.total_volume
    end
    return price
  end
end
