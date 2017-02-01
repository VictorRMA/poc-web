class DepartamentosController < ApplicationController
  before_action :set_departamento, only: [:edit, :update, :show, :destroy]

  def index
    @departamentos = Departamento.all
  end

  def new
    @departamento = Departamento.new
  end

  def edit
  end

  def create
    @departamento = Departamento.new(departamento_params)
    if @departamento.save
      flash[:success] = "Departamento foi criado!"
      redirect_to departamento_path(@departamento)
    else
      render 'new'
    end
  end

  def update
    if @departamento.update(departamento_params)
      flash[:success] = "Departamento foi atualizado com sucesso!"
      redirect_to departamento_path(@departamento)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @departamento.destroy
    flash[:danger] = "Departamentos was successfully deleted!"
    redirect_to departamentos_path
  end


  private
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    def departamento_params
      params.require(:departamento).permit(:nome)
    end
end
