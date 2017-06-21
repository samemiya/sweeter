require 'test_helper'

class SweetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
