require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    CostCenter.create(id: 1, number: 1, name: "Cost Center test name")

    @task = Task.new(name: "Task name", cost_center_id: 1)
  end

  test "task should be valid" do
    assert @task.valid?
  end

  test "name should be present" do
    @task.name = ""
    assert_not @task.valid?
  end

  test "name should not be too long" do
    @task.name = "a" * 33
    assert_not @task.valid?
  end

  test "name should not be too short" do
    @task.name = "aa"
    assert_not @task.valid?
  end

  test "cost center should be present" do
    @task.cost_center_id = nil
    assert_not @task.valid?
  end

end
