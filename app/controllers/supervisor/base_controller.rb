class Supervisor::BaseController < ApplicationController
  before_action  :authorize_supervisor

  private
  def authorize_supervisor
    unless current_user.supervisor? || current_user.admin?
      flash[:danger] = t "flash.only_supervisor"
      redirect_to root_url
    end
  end
end
