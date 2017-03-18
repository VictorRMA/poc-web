require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  def setup
    @department = Department.new(id: 1, name: "Jane's department")
    @department.save

    @employee = Employee.new(first_name: "Jane",
                              last_name: "Doe",
                              email: "jane.doe@fusionltda.com",
                              password: "123",
                              department_id: 1)
  end

  test "employee should be valid" do
    assert @employee.valid?
  end

  test "first_name should be present" do
    @employee.first_name = ""
    assert_not @employee.valid?
  end

  test "last_name should be present" do
    @employee.last_name = ""
    assert_not @employee.valid?
  end

  test "first_name should not be less than 2" do
    @employee.first_name = "a"
    assert_not @employee.valid?
  end

  test "last_name should not be less than 2" do
    @employee.last_name = "a"
    assert_not @employee.valid?
  end

  test "email should be present" do
    @employee.email = ""
    assert_not @employee.valid?
  end

  test "email should be regexp valid" do
    @employee.email = "jane.doe@example.com"
    assert_not @employee.valid?

    @employee.email = "jane.doe@fusionltda"
    assert_not @employee.valid?

    @employee.email = "@fusionltda.com"
    assert_not @employee.valid?

    @employee.email = "jane.doefusionltda.com"
    assert_not @employee.valid?

    @employee.email = "jane.doe@fusionltda.cm"
    assert_not @employee.valid?
  end

  test "email should not be too long" do
    @employee.email = "a" * 91 + "@fusionltda.com"
    assert_not @employee.valid?
  end

  test "email should be unique" do
    @employee.save

    employee2 = Employee.new(first_name: "Jane",
                              last_name: "Doe",
                              email: "jane.doe@fusionltda.com",
                              password: "123",
                              department_id: 1)

    assert_not employee2.valid?
  end

  test "email should be transform to lowercase" do
    @employee.email = "JANE.DOE@FUSIONLTDA.COM"
    @employee.save

    assert @employee.email === "jane.doe@fusionltda.com"
  end

  test "department_id should be present" do
    @employee.department_id = nil

    assert_not @employee.valid?
  end

  test "password_confirmation should be match" do
    @employee.password_confirmation = "123"
    assert @employee.valid?

    @employee.password_confirmation = "12"
    assert_not @employee.valid?
  end

  test "full_name should be first_name plus last_name" do
    assert @employee.full_name === "#{@employee.first_name} #{@employee.last_name}"
  end

end
