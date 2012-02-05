require 'test_helper'

class ChoreInstancesControllerTest < ActionController::TestCase
  setup do
    @chore_instance = chore_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chore_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chore_instance" do
    assert_difference('ChoreInstance.count') do
      post :create, chore_instance: @chore_instance.attributes
    end

    assert_redirected_to chore_instance_path(assigns(:chore_instance))
  end

  test "should show chore_instance" do
    get :show, id: @chore_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chore_instance
    assert_response :success
  end

  test "should update chore_instance" do
    put :update, id: @chore_instance, chore_instance: @chore_instance.attributes
    assert_redirected_to chore_instance_path(assigns(:chore_instance))
  end

  test "should destroy chore_instance" do
    assert_difference('ChoreInstance.count', -1) do
      delete :destroy, id: @chore_instance
    end

    assert_redirected_to chore_instances_path
  end
end
