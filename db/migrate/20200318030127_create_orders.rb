class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment_method,default: 0, null: false
      t.integer :postage, null: false
      t.integer :charge, null: false
      t.integer :status, null: false
      t.string :name_address, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
