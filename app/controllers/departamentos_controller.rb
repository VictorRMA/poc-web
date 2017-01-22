class DepartamentosController < ApplicationController
  def index
    @departamentos = Departamento.all
  end

  def new
    @departamento = Departamento.new
  end

  def edit
    @departamento = Departamento.find(params[:id])
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

  def update
    @departamento = Departamento.find(params[:id])
    if @departamento.update(departamento_params)
      flash[:notice] = "Departamento foi atualizado com sucesso!"
      redirect_to departamento_path(@departamento)
    else
      render 'edit'
    end
  end

  def show
    @departamento = Departamento.find(params[:id])
  end

  def destroy
    @departamento = Departamento.find(params[:id])
    @departamento.destroy
    flash[:notice] = "Departamentos was successfully deleted!"
    redirect_to departamentos_path
  end


  private
    def departamento_params
      params.require(:departamento).permit(:nome)
    end
end
