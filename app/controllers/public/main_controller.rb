class Public::MainController < ApplicationController

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

end
