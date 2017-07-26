class DashboardController < ApplicationController
  before_action :require_authentication, only: [:index]

  def index
    @work_times = WorkTime.last(4).reverse!
  end

end
