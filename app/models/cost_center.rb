class CostCenter < ActiveRecord::Base
  has_many :tasks

  validates :number, presence: true
  validates :name, presence: true,
                   length: { in: 3..32 }
  validates_uniqueness_of :number
end
