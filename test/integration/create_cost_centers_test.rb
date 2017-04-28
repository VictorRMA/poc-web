require 'test_helper'

class CreateCostCentersTest < ActionDispatch::IntegrationTest

  def setup
    @department = Department.create(id: 1, name: "Jane's department")
    @employee = Employee.create(first_name: "Jane",
                                last_name: "Doe",
                                email: "jane.doe@fusionltda.com",
                                password: "123",
                                department_id: 1,
                                admin: true)
  end

  test "get new cost center form and create cost center" do
    sign_in_as(@employee, "123")
    get new_cost_center_path
    assert_template 'cost_centers/new'
    assert_difference 'CostCenter.count', 1 do
      post '/cost_centers', params: {cost_center: {number: 1, name: "Cost Center test name"}}
      follow_redirect!
    end
    assert_template 'cost_centers/index'
    assert_match "Cost Center test name", response.body
  end

  test "get new cost center form and not create invalid cost center with no number" do
    sign_in_as(@employee, "123")
    get new_cost_center_path
    assert_template 'cost_centers/new'
    assert_no_difference 'CostCenter.count' do
      post '/cost_centers', params: {cost_center: {name: "Cost Center test name"}}
    end
    assert_template 'cost_centers/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "get new cost center form and not create invalid cost center with invalid name" do
    sign_in_as(@employee, "123")
    get new_cost_center_path
    assert_template 'cost_centers/new'
    assert_no_difference 'CostCenter.count' do
      post '/cost_centers', params: {cost_center: {number: 1, name: " "}}
    end
    assert_template 'cost_centers/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end
