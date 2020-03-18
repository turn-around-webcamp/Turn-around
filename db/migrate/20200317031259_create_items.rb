class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :text, null: false
      t.string :image, null: false
      t.boolean :status, null: false
      t.integer :non_tax_price, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
