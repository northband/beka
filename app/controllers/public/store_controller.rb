class Public::StoreController < Public::MainController

  def index
    @category = Category.find(params[:category]) if params[:category]
    @products = if @category
      categories = @category.subtree_ids
      Product.has_categories(categories).paginate(:page => params[:page])
    else
      Product.all.paginate(:page => params[:page])
    end
  end

  def add_to_cart
    begin
      product = Product.find(params[:id])
      @cart.add_product(product)
      redirect_to :action => 'cart', :id => @cart
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      flash[:notice] = "Invalid product"
      redirect_to_index('Invalid product')
    end
  end
  
  def show
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
    @order.is_active = true
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

  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end

end
