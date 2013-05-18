class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :product_qty, :product_unit_price, :foreign_key => "order_id", :foreign_key => "product_id"

  #Validations

  #Associations
  belongs_to :order
  belongs_to :product
end
