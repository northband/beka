class Admin::CategoriesController < Admin::MainController

  def index
    @categories = Category.roots
  end
  
  def new
    @category = Category.new
  end
  
  def create
    if request.post?
      begin
        if params[:parent]
          @category = Category.find(params[:parent])
          @category.children.create!(params[:category])
        else
          @category = Category.new(params[:category])
          @category.save!
        end
        redirect_to :action => 'index'
      rescue
        render :action => 'new'
      end
    end

  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to :action => 'index'
      flash[:notice] = 'Category was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    begin
      @category.destroy
    rescue => e
      flash[:notice] = "#{e}"
    end
    redirect_to(admin_categories_url)
  end

end