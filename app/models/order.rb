class Order < ActiveRecord::Base
  attr_accessible :user_id, :status, :cc_type, :card_no, :foreign_key => "user_id"

  #Validations
  validates :cc_type, :presence => true
  validates :card_no, :presence => true
  
  #Associations
  belongs_to :user
  has_many :order_items
end
