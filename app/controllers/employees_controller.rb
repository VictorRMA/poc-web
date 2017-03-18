class EmployeesController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

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
      params.require(:employee).permit(:first_name, :last_name, :email, :password)
    end
    def set_user
      @employee = Employee.find(params[:id])
    end
    def require_same_user
      if current_user != @employee
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end
end
