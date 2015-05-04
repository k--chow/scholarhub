require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  def destroy
  	log_out if loggin_in?
  	redirect_to root_url

end
