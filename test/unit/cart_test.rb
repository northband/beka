require 'test_helper'

class CartTest < ActiveSupport::TestCase

  fixtures :products

  test "add unique products" do
    cart = Cart.new
    mystery_book = products(:mystery_book)
    ruby_book  = products(:ruby_book)
    cart.add_product mystery_book
    cart.add_product ruby_book
    assert_equal 2, cart.items.size
    assert_equal mystery_book.price + ruby_book.price, cart.total_price
  end

  test "add_duplicate_product" do
    cart = Cart.new
    mystery_book = products(:mystery_book)
    cart.add_product mystery_book
    cart.add_product mystery_book
    assert_equal 2*mystery_book.price, cart.total_price
    assert_equal 1, cart.items.size
    assert_equal 2, cart.items[0].quantity
  end


end
