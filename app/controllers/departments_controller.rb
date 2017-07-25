class DepartmentsController < ApplicationController
  before_action :redirect_if_not_logged, only: [:index, :new, :create, :update, :show, :edit, :destroy]
  before_action :set_department, only: [:edit, :update, :show, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = "Departamento foi criado!"
      redirect_to department_path(@department)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      flash[:success] = "Departamento foi atualizado com sucesso!"
      redirect_to department_path(@department)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @department.destroy
    flash[:danger] = "Departments was successfully deleted!"
    redirect_to departments_path
  end


  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name)
    end

    def require_admin
      if !logged_as_admin?
        flash[:danger] = "Only administrators can perform this action!"
        redirect_to root_path
      end
    end

end
