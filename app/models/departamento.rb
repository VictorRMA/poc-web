class Departamento < ActiveRecord::Base
  validates :nome, presence: true, length: {minimum: 3, maximum: 50}

end
