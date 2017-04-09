class SessionsController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]

  def new
    @session = Session.new(session)
  end

  def create
    @session = Session.new(session, params[:session])

    if @session.authenticate!
      flash[:success] = "Logged with success!"
      redirect_to departments_path
    else
      flash.now[:danger] = "Wrong parameters!"
      render 'new'
    end
  end

  def destroy
    employee_session.destroy
    flash[:success] = "Logged out!"
    redirect_to root_path
  end

end
