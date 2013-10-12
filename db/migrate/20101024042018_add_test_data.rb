class AddTestData < ActiveRecord::Migration

  def self.up
    Product.delete_all
    for x in 0..9
      Product.create(:title => "Sample Product #{x}",
        :description => %{<p>Lorem ipsum delorme.  Lorem ipsum delorme.  Lorem ipsum delorme.  Lorem ipsum delorme.</p>},
        :price => 50.00
      )
    end

  end

  def self.down
    Product.delete_all
  end

end
