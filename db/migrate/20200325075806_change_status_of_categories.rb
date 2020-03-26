class ChangeStatusOfCategories < ActiveRecord::Migration[5.2]
  def up
  	  change_column :categories, :status, :boolean, default: true
  end
  
  def down
  	  change_column :categories, :status, :boolean
  end
end
