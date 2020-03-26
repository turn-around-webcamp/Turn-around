class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order
    enum status:{着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3}
# ここだけに数字。データベースの中身は数字で保存
end
