class AddInitialColumnToOrders < ActiveRecord::Migration
  add_column :orders, :user_id, :integer
  add_column :orders, :status, :string
  add_column :orders, :cc_type, :string
  add_column :orders, :card_no, :string
end
