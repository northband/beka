class Admin::ProductImagesController < Admin::MainController

  def show
    @product_image = ProductImage.find(params[:id])
    render :layout => 'simple'
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

  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    redirect_to :back
    # redirect_to(admin_products_url)
  end

end