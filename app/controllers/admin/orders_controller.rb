class Admin::OrdersController < Admin::MainController

  def index
    @orders = if params[:archived]
      Order.inactive.find(:all, :order => 'created_at DESC').paginate(:page => params[:page])
    else
      Order.active.find(:all, :order => 'created_at DESC').paginate(:page => params[:page])
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      redirect_to admin_orders_path
      flash[:notice] = 'Order was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(admin_orders_url)
  end

end
