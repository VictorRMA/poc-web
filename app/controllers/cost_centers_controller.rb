class CostCentersController < ApplicationController

  def index
    @cost_centers = CostCenter.all
  end

  def new
    @cost_center = CostCenter.new
  end

  def create
    @cost_center = CostCenter.new(cost_center_params)
    if @cost_center.save
      redirect_to cost_centers_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  private
    def cost_center_params
      params.require(:cost_center).permit(:number, :name)
    end
end
