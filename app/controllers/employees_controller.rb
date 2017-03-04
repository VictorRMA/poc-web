class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

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

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = "Funcionário foi atualizado com sucesso!"
      redirect_to employee_path(@employee)
    else
      render 'edit'
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :password)
    end
end
