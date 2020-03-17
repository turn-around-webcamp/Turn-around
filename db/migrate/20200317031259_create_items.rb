class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :text
      t.string :image
      t.boolean :status
      t.integer :non_tax_price
      t.integer :category_id

      t.timestamps
    end
  end
end
