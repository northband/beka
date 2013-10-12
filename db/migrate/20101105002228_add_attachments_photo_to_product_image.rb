class AddAttachmentsPhotoToProductImage < ActiveRecord::Migration
  def self.up
    create_table :product_images do |t|
      t.integer :product_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
    end
  end

  def self.down
    drop_table :product_images
  end
end