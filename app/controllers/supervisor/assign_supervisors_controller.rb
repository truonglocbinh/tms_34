class Supervisor::AssignSupervisorsController < Supervisor::BaseController
  before_action :load_course, only: [:index]
  before_action :verify_supervisor, only: [:index]

  def index
    @supervisors = @course.users.supervisors
    (User.supervisors - @supervisors).each do |supervisor|
      @course.user_courses.build user: supervisor
    end
  end
end
