class DepartamentosController < ApplicationController
  def new
    @departamento = Departamento.new
  end

  def create
    @departamento = Departamento.new(departamento_params)
    if @departamento.save
      flash[:notice] = "Departamento foi criado!"
      redirect_to departamento_path(@departamento)
    else
      render 'new'
    end
  end

  def show
    @departamento = Departamento.find(params[:id])
  end

  private
    def departamento_params
      params.require(:departamento).permit(:nome)
    end
end
