require 'test_helper'

class GoodbyesControllerTest < ActionController::TestCase
  setup do
    @goodbye = goodbyes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goodbyes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goodbye" do
    assert_difference('Goodbye.count') do
      post :create, goodbye: { title: @goodbye.title }
    end

    assert_redirected_to goodbye_path(assigns(:goodbye))
  end

  test "should show goodbye" do
    get :show, id: @goodbye
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goodbye
    assert_response :success
  end

  test "should update goodbye" do
    put :update, id: @goodbye, goodbye: { title: @goodbye.title }
    assert_redirected_to goodbye_path(assigns(:goodbye))
  end

  test "should destroy goodbye" do
    assert_difference('Goodbye.count', -1) do
      delete :destroy, id: @goodbye
    end

    assert_redirected_to goodbyes_path
  end
end
