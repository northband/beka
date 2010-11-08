class ModifyOrdersAddShippedAndActiveFlag < ActiveRecord::Migration
  def self.up
    add_column :orders, :is_active, :boolean, :default => false
    add_column :orders, :shipped_on, :datetime
  end

  def self.down
    remove_column :orders, :is_active
    remove_column :orders, :shipped_on
  end
end
