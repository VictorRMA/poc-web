class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  delegate :current_employee, :logged_in?, to: :employee_session
  helper_method :current_employee, :logged_in?, :logged_as_admin?

  def employee_session
    Session.new(session)
  end

  def require_authentication
    unless logged_in?
      flash[:danger] = "You need to log in to perform this action"
      redirect_to root_path
    end
  end

  def require_no_authentication
    if logged_in?
      redirect_to root_path
    end
  end

  def logged_as_admin?
    logged_in? and current_employee.admin?
  end
end
