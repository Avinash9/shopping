class Shoppingcart < ActiveRecord::Base
  attr_accessible :user_id, :product_id, :quantity, :foreign_key => "user_id", :foreign_key => "product_id"

  #Validations
  validates :quantity, :presence => true

  #Associations
  belongs_to :product
  belongs_to :user

  def Shoppingcart.retrieve_cart(user_id)
    sc = Shoppingcart.find_by_sql("SELECT p.name, p.description, p.price, p.image_url, sc.id, sc.quantity
                                          FROM products p, shoppingcarts sc
                                          WHERE p.id = sc.product_id and sc.user_id = " + user_id.to_s)
    if sc
      return sc
    else
      return NIL
    end
  end

end
