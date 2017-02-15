class Department < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: {minimum: 3, maximum: 50}

end
