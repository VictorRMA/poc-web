class Task < ActiveRecord::Base
  belongs_to :cost_center

  validates :name, presence: true,
                   length: { in: 3..32 }

  validates :cost_center_id, presence: true
end
