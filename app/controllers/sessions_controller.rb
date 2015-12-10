class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      if current_user.supervisor? || current_user.admin?
        redirect_to supervisor_root_url
      else
        redirect_to courses_path
      end
    else
      flash.now[:danger] = t "flash.login_failed"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
