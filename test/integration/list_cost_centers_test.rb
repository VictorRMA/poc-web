require 'test_helper'

class ListCostCentersTest < ActionDispatch::IntegrationTest

  def setup
    @cost_center = CostCenter.create(number: 1, name: "Cost Center one")
    @cost_center2 = CostCenter.create(number: 2, name: "Cost Center two")
  end

  test "should show cost center listing" do
    get cost_centers_path
    assert_template "cost_centers/index"
    assert_select "a[href=?]", cost_center_path(@cost_center), text: @cost_center.name
    assert_select "a[href=?]", cost_center_path(@cost_center2), text: @cost_center2.name
  end

end
