class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_employee, :logged_in?, :logged_as_admin?

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def logged_in?
    !!current_employee
  end

  def require_employee
    if !logged_in?
      flash[:danger] = "You need to log in to perform this action"
      redirect_to root_path
    end
  end

  def require_logged_out
    if logged_in?
      redirect_to root_path
    end
  end

  def logged_as_admin?
    logged_in? and current_employee.admin?
  end
end
