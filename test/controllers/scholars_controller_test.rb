require 'test_helper'

class ScholarsControllerTest < ActionController::TestCase
  setup do
    @scholar = scholars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scholars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scholar" do
    assert_difference('Scholar.count') do
      post :create, scholar: { email: @scholar.email, name: @scholar.name, school: @scholar.school }
    end

    assert_redirected_to scholar_path(assigns(:scholar))
  end

  test "should show scholar" do
    get :show, id: @scholar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scholar
    assert_response :success
  end

  test "should update scholar" do
    patch :update, id: @scholar, scholar: { email: @scholar.email, name: @scholar.name, school: @scholar.school }
    assert_redirected_to scholar_path(assigns(:scholar))
  end

  test "should destroy scholar" do
    assert_difference('Scholar.count', -1) do
      delete :destroy, id: @scholar
    end

    assert_redirected_to scholars_path
  end
end
