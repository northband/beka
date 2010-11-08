class ApplicationController < ActionController::Base

  USER_NAME, PASSWORD = 'admin', 'ohio'

  before_filter :authenticate # unless Rails.env.development?
  before_filter :find_cart, :except => :empty_cart

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == USER_NAME && password == PASSWORD
    end
  end

  def find_cart
    @cart = if session[:cart_id]
      Cart.find(session[:cart_id]) || Cart.create
    else
      Cart.create
    end
    session[:cart_id] = @cart.id if session[:cart_id].blank?
  end

end
