class Employee < ActiveRecord::Base
  belongs_to :department
  has_many :work_times
  has_many :tasks, through: :work_times

  before_save { self.email = email.downcase }

  validates :first_name, :last_name,
            presence: true,
            length: { minimum: 2 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@fusionltda.com\z/i
  validates :email,
            presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :department_id, presence: true
  has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.authenticate(email, password)
    employee = Employee.find_by(email: email).
                         try(:authenticate, password)
  end
end
