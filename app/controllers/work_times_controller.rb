class WorkTimesController < ApplicationController
  before_action :require_authentication, only: [:index, :new, :create, :show, :edit]
  before_action :set_work_time, only: [:show, :edit, :update]

  def index
    @work_times = WorkTime.all
  end

  def new
    @work_time = WorkTime.new
  end

  def create
    @work_time = WorkTime.new(work_time_params)
    if @work_time.save
      redirect_to work_times_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @work_time.update(work_time_params)
      flash[:success] = "WorkTime successfully updated!"
      redirect_to work_time_path(@work_time)
    else
      render 'edit'
    end
  end

  private
    def work_time_params
      params.require(:work_time).permit(:description, :datetime_start, :datetime_end, :employee_id, :task_id)
    end

    def set_work_time
      @work_time = WorkTime.find(params[:id])
    end
end
