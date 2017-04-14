require 'test_helper'

class CreateCostCentersTest < ActionDispatch::IntegrationTest

  test "get new cost center form and create cost center" do
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
