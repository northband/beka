class Admin::ProductImagesController < Admin::MainController

  def show
    @product_image = ProductImage.find(params[:id])
    render :layout => 'simple'
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def new
    @product_image = ProductImage.new
    @product = Product.find(params[:id])
  end

  def create
    if request.post?

      @product_image = ProductImage.new(params[:product_image])
      @product = Product.find(params[:id])
      @product.product_images << @product_image
      
      flash[:notice] = "Image added"
      redirect_to :action => 'new', :id => params[:id]
      
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