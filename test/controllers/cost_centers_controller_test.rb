require 'test_helper'

class CostCentersControllerTest < ActionController::TestCase

  def setup
    @cost_center = CostCenter.create(number: 1, name: "Cost Center test name")
    @department = Department.create(id: 1, name: "Jane's department")
    @employee = Employee.create(first_name: "Jane",
                                last_name: "Doe",
                                email: "jane.doe@fusionltda.com",
                                password: "123",
                                department_id: 1,
                                admin: true)
  end

  test "should get cost centers index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    session[:employee_id] = @employee.id
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, params: {id: @cost_center.id}
    assert_response :success
  end

  test "should get edit" do
    session[:employee_id] = @employee.id
    get :edit, params: {id: @cost_center.id}
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'CostCenter.count' do
      post :create, params: {cost_center: {number: 1, name: "Cost Center test name"}}
    end
    assert_redirected_to cost_centers_path
  end
end
