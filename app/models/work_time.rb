class WorkTime < ActiveRecord::Base
  belongs_to :employee
  belongs_to :task

  validate :check_dates

  def check_dates
    errors.add(:base, "End date should be greater than start") if self.datetime_start >= self.datetime_end
  end
end
