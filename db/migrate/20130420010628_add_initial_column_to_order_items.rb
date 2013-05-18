class AddInitialColumnToOrderItems < ActiveRecord::Migration
  add_column :order_items, :order_id, :integer
  add_column :order_items, :product_id, :integer
  add_column :order_items, :product_qty, :integer
  add_column :order_items, :product_unit_price, :integer
end