require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  # Replace this with your real tests.
  test "invalid with empty attributes" do
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
  end
  
  test "valid price" do
    product = Product.new(:title => "Test Book",
                          :description => products(:ruby_book).description,
                          :price => products(:ruby_book).price
              )
    assert product.valid?, "price needs to be greater than 0.01"

  end
  
  test "unique title" do
    product = Product.new(:title => products(:ruby_book).title,
                          :description => "test description",
                          :price => 1
              )
    assert !product.save
    assert_equal "has already been taken", product.errors.on(:title)
  end

end
