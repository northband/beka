class Admin::ProductsController < Admin::MainController

  def index
    @products = Product.all.paginate(:page => params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    if request.post?
      @product = Product.new(params[:product])
      if @product.save
        redirect_to :action => 'index'
      else
         render :action => "new"
      end
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to :action => 'index'
      flash[:notice] = 'Product was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to(admin_products_url)
  end

end