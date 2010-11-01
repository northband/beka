require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  fixtures :users

  test "index" do
    get :index
    assert_redirected_to :controller => "admin", :action => "login"
    assert_equal "Please log in", flash[:notice]
  end
  
  test "index with user" do
    get :index, {}, { :user_id => users(:adam).id }
    assert_response :success
    assert_template "index"
  end

  test "login" do
    adam = users(:adam)
    post :login, :name => adam.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal adam.id, session[:user_id]
  end

  test "bad password" do
    adam = users(:adam)
    post :login, :name => adam.name, :password => 'bad_password'
    assert_template "login"
  end

end
