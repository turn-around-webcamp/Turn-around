class AddColumsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name_japanese, :string
    add_column :users, :first_name_japanese, :string
    add_column :users, :last_name_katakana, :string
    add_column :users, :first_name_katakana, :string
    add_column :users, :address, :string
    add_column :users, :postal_code, :string
    add_column :users, :tel, :string
  end
end
