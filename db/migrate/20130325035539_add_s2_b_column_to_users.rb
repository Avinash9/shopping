class AddS2BColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_billing_same, :boolean
  end
end
