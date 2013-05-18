class CreateShoppingcarts < ActiveRecord::Migration
  def change
    create_table :shoppingcarts do |t|

      t.timestamps
    end
  end
end
