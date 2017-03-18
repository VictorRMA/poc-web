require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase

  def setup
    @department = Department.new(name: "Jane's department")
  end

  test "department should be valid" do
    assert @department.valid?
  end

  test "name should be present" do
    @department.name = ""
    assert_not @department.valid?
  end

  test "name should not be too short" do
    @department.name = "aa"
    assert_not @department.valid?
  end

  test "name should not be too long" do
    @department.name = "a" * 51
    assert_not @department.valid?
  end


end
