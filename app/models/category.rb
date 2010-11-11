class Category < ActiveRecord::Base

  has_many :products
  
  validates_presence_of :name
  
  # Using Ancestry gem for tree structure
  has_ancestry :orphan_strategy => :restrict

end
