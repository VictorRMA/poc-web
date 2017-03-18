class CostCenter < ActiveRecord::Base
  validates :name, presence: true,
                   length: { in: 3..32 }
  validates_uniqueness_of :name
end
