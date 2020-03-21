class User < ApplicationRecord
  acts_as_paranoid
  has_many :delivery_addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         def full_name_japanese
          last_name_japanese+first_name_japanese
         end
         def full_name_katakana
          last_name_katakana+first_name_katakana
         end
end
