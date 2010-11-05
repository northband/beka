class ProductImage < ActiveRecord::Base

  belongs_to :product

  has_attached_file :photo, 
    :styles => { :small => "150x150>", :large => "320x240>" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => ":attachment/:id/:style/:basename.:extension",
    :bucket => 'cart_sample'
    
#  validates_attachment_presence :photo
#  validates_attachment_size :photo, :less_than => 5.megabytes



end