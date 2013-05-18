class RemoveskuColumnFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :sku
  end
end
