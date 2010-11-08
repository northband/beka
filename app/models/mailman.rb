class Mailman < ActionMailer::Base
  helper :application
  
  def contact_us(message)
    recipients   "northband@gmail.com"
    subject      "Message from Contact Us Form"
    from         "northband@gmail.com"
    reply_to     "northband@gmail.com"
    sent_on      Time.now
    body         :name => message[:name], :email => message[:email], :message => message[:message]
  end

end
