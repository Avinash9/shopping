class AddInitialColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sku, :string
    add_column :products, :name, :string
    add_column :products, :description, :string
    add_column :products, :quantity, :integer
    add_column :products, :price, :integer
    add_column :products, :category, :string
    add_column :products, :related_type, :string
    add_column :products, :old_new, :string
    add_column :products, :image_url, :string
  end
end
