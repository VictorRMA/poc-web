class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]

  def new

  end

  def create
    employee = Employee.find_by(email: params[:session][:email].downcase)

    if employee && employee.authenticate(params[:session][:password])
      session[:employee_id] = employee.id
      flash[:success] = "Logged with success!"
      redirect_to employee_path(employee)
    else
      flash.now[:danger] = "Something wrong with parameters!"
      render 'new'
    end
  end

  def destroy
    session[:employee_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_path
  end

end
