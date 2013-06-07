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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sing_log" do
    assert_difference('SingLog.count') do
      post :create, sing_log: { song_id: @sing_log.song_id }
    end

    assert_redirected_to sing_log_path(assigns(:sing_log))
  end

  test "should show sing_log" do
    get :show, id: @sing_log
    assert_response :success
  end

  test "should destroy sing_log" do
    assert_difference('SingLog.count', -1) do
      delete :destroy, id: @sing_log
    end

    assert_redirected_to sing_logs_path
  end
end
