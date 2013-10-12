class ApplicationController < ActionController::Base

  USER_NAME, PASSWORD = 'admin', 'ohio'

  before_filter :authenticate # unless Rails.env.development?

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == USER_NAME && password == PASSWORD
    end
  end

end
