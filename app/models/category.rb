class Category < ActiveRecord::Base

  # Associations
  has_many :products

  # Validations
  validates_presence_of :name
  
  # Using Ancestry gem for tree structure
  has_ancestry :orphan_strategy => :restrict

end
