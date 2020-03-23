# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'adminadmin',
)#管理者ログインの初期設定

User.create!(
  last_name_japanese: '検証',
  first_name_japanese: '太郎',
  last_name_katakana: 'ケンショウ',
  first_name_katakana: 'タロウ',
  address: 'tttttt',
  postal_code: '1111111',
  tel: '11111111111',
  email: 'test@test2',
  password: 'testtest',
  )

Category.create!(
  name: 'ケーキ',
  status: 'false',
  )

Item.create!(
    name: 'いちごのショートケーキ',
    text: 'おいしいいちごのショートケーキです',
    non_tax_price: 1000,
    status: 'false',
    category_id: 1,
  )

CartItem.create!(
    total_volume: 2,
    user_id: 1,
    item_id: 1,
  )
Order.create!(
  created_at: 20200323,
  user_id: 1,
  status: 0,
  updated_at: 20200323,
  postage: 800,
  charge: 3000,
  payment_method: 0,
  name_address: '宛名',
  address: '住所',
  postal_code: '111111',
)
