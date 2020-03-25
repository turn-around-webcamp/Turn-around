class ChangeStatusOfOrders < ActiveRecord::Migration[5.2]
  def up
  	  change_column :orders, :status, :integer, default: 0, null: false
  end
  
  def down
  	  change_column :orders, :status, :integer, null: false
  end
end
