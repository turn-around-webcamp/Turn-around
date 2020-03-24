class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order
    enum status:[:着手不可,:制作待ち,:制作中,:制作完了]

end
