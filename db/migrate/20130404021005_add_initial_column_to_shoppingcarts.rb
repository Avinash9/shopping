class AddInitialColumnToShoppingcarts < ActiveRecord::Migration
  def change
    add_column :shoppingcarts, :user_id, :integer
    add_column :shoppingcarts, :product_id, :integer
    add_column :shoppingcarts, :quantity, :integer
  end
end
