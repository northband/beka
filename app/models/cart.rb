class Cart < ActiveRecord::Base

  # Associations
  has_many :cart_items

  def add_product(product)
    current_item = self.cart_items.find_by_product_id(product.id)
    if current_item
      item = current_item
      item.increment_quantity
      item.save!
    else
      item = CartItem.new
      item.product = product
      self.cart_items << item
    end
    current_item
  end

  def total_price
    self.cart_items.collect{ |item| (item.product.price * item.quantity) }.sum
  end

  def total_items
    cart_items.collect{ |item| item.quantity }.sum
  end

end