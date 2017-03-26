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
end
