class AddUserIdToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_addresses, :user_id, :integer
  end
end
