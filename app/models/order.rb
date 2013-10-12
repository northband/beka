class Order < ActiveRecord::Base

  # Associations
  has_many :line_items

  PAYMENT_TYPES = [
    ["Check", "check"],
    ["Credit Card", "cc"],
    ["Purchase Order", "po"]
  ]

  # Validations
  validates_presence_of :name, :address, :email, :pay_type
  validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map { |disp, value| value }

  # Scopes
  named_scope :active, :conditions => {:is_active => true}
  named_scope :inactive, :conditions => {:is_active => false}

  def add_line_items_from_cart(cart)
    cart.cart_items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end
  
end
