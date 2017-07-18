require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  def setup
    # Department.create(id: 1, name: "Jane's department")
    # @employee = Employee.create(first_name: "Jane",
    #                             last_name: "Doe",
    #                             email: "jane.doe@fusionltda.com",
    #                             password: "123",
    #                             department_id: 1,
    #                             admin: true)

    CostCenter.create(id: 1, number: 1, name: "Cost Center test name")
    @task = Task.create(name: "Task name", cost_center_id: 1)

  end

  test "should get task index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, params: {id: @task.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @task.id}
    assert_response :success
  end

end
