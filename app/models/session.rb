class Session
  include ActiveModel::Model

  attr_accessor :email, :password
  validates_presence_of :email, :password

  def initialize(session, attributes={})
    @session = session
    @email = attributes[:email]
    @password = attributes[:password]
  end

  def authenticate!
    employee = Employee.authenticate(@email, @password)

    if employee.present?
      store(employee)
    else
      false
    end
  end

  def store(employee)
    @session[:employee_id] = employee.id
  end

  def destroy
    @session[:employee_id] = nil
  end

  def current_employee
    @current_employee ||= Employee.find(@session[:employee_id]) if @session[:employee_id]
  end

  def logged_in?
    !!current_employee
  end
end
