class Product < ActiveRecord::Base
  attr_accessible :sku, :name, :description, :quantity, :price, :category, :related_type, :old_new, :image_url

#Validations
  validates :name, :presence => true
  validates_length_of :name, :minimum => 1
  validates :quantity, :presence => true, :numericality => true
  validates :price, :presence => true, :numericality => true
  validates :category, :presence => true

#Association
  has_many :shoppingcarts, :dependent => :delete_all
  has_many :order_items
end
