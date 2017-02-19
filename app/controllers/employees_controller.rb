class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.department = Department.last          #TODO: Remove this
    if @employee.save
      flash[:success] = "Bem vindo #{@employee.first_name}"
      redirect_to departments_path
    else
      render 'new'
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :password)
    end
end
