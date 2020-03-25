class Category < ApplicationRecord
  has_many :items
  enum status: {"無効":false,"有効":true}
end
