class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show]
  before_action :require_authentication, only: [:edit, :update, :destroy]
  before_action :require_no_authentication, only: [:new, :create]
  before_action :require_same_employee, only: [:edit, :update]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      flash[:success] = "Bem vindo #{@employee.first_name}"
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:success] = "Funcionário foi atualizado com sucesso!"
      redirect_to employee_path(@employee)
    else
      render 'edit'
    end
  end

  def show
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    def set_employee
      @employee = Employee.find(params[:id])
    end
    def require_same_employee
      if current_employee != @employee and !current_employee.admin?
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end
end
