class Admin::ProductsController < Admin::MainController

  def index
    @category = Category.find(params[:category]) if params[:category]
    @products = if @category
      categories = @category.subtree_ids
      Product.has_categories(categories).paginate(:page => params[:page])
    else
      Product.all.paginate(:page => params[:page])
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def media
    @product = Product.find(params[:id])
    @product_image = ProductImage.new
  end

  def create
    if request.post?
      @product = Product.new(params[:product])
      @product.category_id = params[:category] if params[:category]
      if @product.save
        redirect_to new_admin_product_image_path(:id => @product)
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