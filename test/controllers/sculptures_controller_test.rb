require 'test_helper'

class SculpturesControllerTest < ActionController::TestCase
  setup do
    @sculpture = sculptures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sculptures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sculpture" do
    assert_difference('Sculpture.count') do
      post :create, sculpture: {  }
    end

    assert_redirected_to sculpture_path(assigns(:sculpture))
  end

  test "should show sculpture" do
    get :show, id: @sculpture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sculpture
    assert_response :success
  end

  test "should update sculpture" do
    patch :update, id: @sculpture, sculpture: {  }
    assert_redirected_to sculpture_path(assigns(:sculpture))
  end

  test "should destroy sculpture" do
    assert_difference('Sculpture.count', -1) do
      delete :destroy, id: @sculpture
    end

    assert_redirected_to sculptures_path
  end
end
