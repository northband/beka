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
  
  test "positive_price" do
    product = Product.new(:title => "My book title", :description => 'My description')

    product.price = -1
    assert !product.valid?
    assert_equal "should be at least 0.01", product.errors.on(:price)

    product.price = 0
    assert !product.valid?
    assert_equal "should be at least 0.01", product.errors.on(:price)

    product.price = 1
    assert product.valid?

  end

end
