require 'test_helper'

class SingLogsControllerTest < ActionController::TestCase
  setup do
    @sing_log = sing_logs(:strength1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sing_logs)
  end
end
