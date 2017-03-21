require 'test_helper'

class CostCentersControllerTest < ActionController::TestCase

  def setup
    @cost_center = CostCenter.create(number: 1, name: "Cost Center test name")
  end

  test "should get cost centers index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, params: {id: @cost_center.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @cost_center.id}
    assert_response :success
  end
end
