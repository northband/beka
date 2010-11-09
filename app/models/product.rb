class Product < ActiveRecord::Base

  has_many :line_items
  has_many :cart_items
  has_many :product_images, :dependent => :destroy

  validates_presence_of :title, :description
  validates_numericality_of :price
  validates_uniqueness_of :title
  validate :price_must_be_at_least_a_cent

  # Temporarily commenting out the ability to have photos nested in the form - too ugly at this time
  #accepts_nested_attributes_for :product_images, :allow_destroy => true

  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  protected

  def price_must_be_at_least_a_cent
    errors.add(:price, 'must at least be a cent') if price.nil? || price < 0.01
  end

end
