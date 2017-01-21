class DepartamentosController < ApplicationController
  def new
    @departamento = Departamento.new
  end

  def create
    #render plain: params[:departamento].inspect
    @departamento = Departamento.new(departamento_params)
    @departamento.save
    redirect_to departamentos_show(@departamento)
  end

  private
    def departamento_params
      params.require(:departamento).permit(:nome)
    end
end
