class Public::MainController < ApplicationController

  before_filter :find_cart, :except => :empty_cart

  layout 'public'

  def index
  end

  def about_us
  end

  def contact_us
    if request.post?
      message = {:name => params[:name], :email => params[:email], :message => params[:message]}
      if Mailman.deliver_contact_us(message)
        flash[:notice] = "Message sent"
      else
        flash[:notice] = "Message not sent - please try again"
      end
    end
  end

  private

  def find_cart
    @cart = if session[:cart_id]
      Cart.find(session[:cart_id]) || Cart.create
    else
      Cart.create
    end
    session[:cart_id] = @cart.id if session[:cart_id].blank?
  end

end
