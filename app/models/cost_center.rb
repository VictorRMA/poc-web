class CostCenter < ActiveRecord::Base
  validates :number, presence: true
  validates :name, presence: true,
                   length: { in: 3..32 }
  validates_uniqueness_of :number
end
