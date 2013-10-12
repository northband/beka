class Product < ActiveRecord::Base

  # Associations
  has_many :line_items
  has_many :cart_items
  has_many :product_images, :dependent => :destroy
  belongs_to :categories

  # Validations
  validates_presence_of :title, :description
  validates_numericality_of :price
  validates_uniqueness_of :title
  validate :price_must_be_at_least_a_cent
  
  # Scopes
  named_scope :has_categories, lambda { |c| { :conditions => ['category_id IN (?)', c] } }

  # Using Norman's friendly_id for url slugs
  has_friendly_id :title, :use_slug => true

  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  protected

  def price_must_be_at_least_a_cent
    errors.add(:price, 'must at least be a cent') if price.nil? || price < 0.01
  end

end
