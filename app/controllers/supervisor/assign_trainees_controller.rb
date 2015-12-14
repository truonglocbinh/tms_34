class Supervisor::AssignTraineesController < Supervisor::BaseController
  before_action :load_course, only: [:index]
  def index
    @trainees = @course.users.trainees.paginate page: params[:page],
      per_page: 10
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
