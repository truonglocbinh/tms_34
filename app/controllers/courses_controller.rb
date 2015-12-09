class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course, :authorize_user, only: :show
  def index
    @courses = current_user.courses.active.latest.paginate page: params[:page],
      per_page: 10
  end

  def show
    @members = @course.users.trainees
    @subjects = @course.subject
  end

  private

  def load_course
    @course = Course.find params[:id]
  end

  def authorize_user
    unless @course.users.include? current_user
      redirect_to root_path
    end
  end
end
