class Task < ActiveRecord::Base
  belongs_to :cost_center
  has_many :work_times
  has_many :employees, through: :work_times

  validates :name, presence: true,
                   length: { in: 3..32 }

  validates :cost_center_id, presence: true
end
