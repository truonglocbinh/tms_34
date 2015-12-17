class Supervisor::BaseController < ApplicationController
  before_action  :authorize_supervisor

  private
  def authorize_supervisor
    unless current_user.supervisor? || current_user.admin?
      flash[:danger] = t "flash.only_supervisor"
      redirect_to root_url
    end
  end

  def load_course
    @course = Course.find params[:course_id]
  end

  def verify_supervisor
    unless @course.users.include? current_user or @course.owner == current_user
      flash[:danger] = t "flash.only_supervisor"
      redirect_to :back
    end
  end
end
