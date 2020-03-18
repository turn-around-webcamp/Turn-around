class AddNameAddressToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_addresses, :name_address, :string
    add_column :delivery_addresses, :address, :integer
    add_column :delivery_addresses, :postal_code, :integer
  end
end
