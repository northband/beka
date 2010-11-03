class Public::StoreController < Public::MainController

  before_filter :find_cart, :except => :empty_cart

  def index
    @products = Product.find_products_for_sale
  end

  def add_to_cart
    begin
      product = Product.find(params[:id])
      @cart.add_product(product)
      redirect_to :action => 'cart', :id => params[:id]
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      flash[:notice] = "Invalid product"
      redirect_to_index('Invalid product')
    end
  end
  
  def view
    @product = Product.find(params[:id])
  end
  
  def cart
  end
  
  def empty_cart
    @cart = Cart.find(session[:cart_id]).destroy
    session[:cart_id] = nil
    redirect_to_index
  end
  
  def checkout
    if @cart.cart_items.empty?
      redirect_to_index("Your cart is empty?")
    else
      @order = Order.new
    end
  end

  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      @cart.destroy
      session[:cart_id] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => 'checkout'
    end
  end

  protected

    def authorize
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
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end

end
