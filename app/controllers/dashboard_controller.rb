class DashboardController < ApplicationController
  before_action :redirect_if_not_logged, only: [:index]

  def index
    redirect_to login_path if !logged_in?
    @work_times = WorkTime.last(4).reverse!
  end

end
