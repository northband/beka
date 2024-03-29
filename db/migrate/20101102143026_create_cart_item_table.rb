class CreateCartItemTable < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end
