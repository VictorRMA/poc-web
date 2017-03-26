class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]

  def new
    @session = Session.new(session)
  end

  def create
    @session = Session.new(session, params[:session])

    if @session.authenticate!
      flash[:success] = "Logged with success!"
      redirect_to departments_path
    else
      flash.now[:danger] = "Wrong"
      render 'new'
    end
  end

  def destroy
    session[:employee_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_path
  end

end
