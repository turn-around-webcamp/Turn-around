class AddNameAddressToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_addresses, :name_address, :string
    add_column :delivery_addresses, :address, :string
    add_column :delivery_addresses, :postal_code, :string
  end
end
