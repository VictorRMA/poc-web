class Employee < ActiveRecord::Base
  validates :first_name, :last_name,
            presence: true,
            length: { minimum: 2 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@fusionltda.com\z/i
  validates :email,
            presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

end
