require 'test_helper'

class CostCenterTest < ActiveSupport::TestCase

  def setup
    @cost_center = CostCenter.new(number: 1, name: "Cost Center test name")
  end

  test "cost center should be valid" do
    assert @cost_center.valid?
  end

  test "name should be present" do
    @cost_center.name = ""
    assert_not @cost_center.valid?
  end

  test "name should not be too long" do
    @cost_center.name = "a" * 33;
    assert_not @cost_center.valid?
  end

  test "name should not be too short" do
    @cost_center.name = "aa"
    assert_not @cost_center.valid?
  end

  test "number should be present" do
    @cost_center.number = ""
    assert_not @cost_center.valid?
  end

  test "number should be unique" do
    @cost_center.save
    cost_center2 = CostCenter.new(number: 1, name: "Another Cost Center test name")
    assert_not cost_center2.valid?
  end

end
