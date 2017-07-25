class TasksController < ApplicationController
  before_action :redirect_if_not_logged, only: [:index, :new, :create, :show, :edit]
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task successfully created!"
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "Task successfully updated!"
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :cost_center_id)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
