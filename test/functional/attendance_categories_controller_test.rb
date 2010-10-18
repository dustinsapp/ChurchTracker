require 'test_helper'

class AttendanceCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_category" do
    assert_difference('AttendanceCategory.count') do
      post :create, :attendance_category => { }
    end

    assert_redirected_to attendance_category_path(assigns(:attendance_category))
  end

  test "should show attendance_category" do
    get :show, :id => attendance_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => attendance_categories(:one).to_param
    assert_response :success
  end

  test "should update attendance_category" do
    put :update, :id => attendance_categories(:one).to_param, :attendance_category => { }
    assert_redirected_to attendance_category_path(assigns(:attendance_category))
  end

  test "should destroy attendance_category" do
    assert_difference('AttendanceCategory.count', -1) do
      delete :destroy, :id => attendance_categories(:one).to_param
    end

    assert_redirected_to attendance_categories_path
  end
end
