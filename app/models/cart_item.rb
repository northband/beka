class CartItem < ActiveRecord::Base

  belongs_to :cart, :dependent => :destroy
  belongs_to :order
  belongs_to :product
  
  def increment_quantity
    self.quantity += 1
    self.save!
  end
 
  def price
    self.product.price * self.quantity
  end

end