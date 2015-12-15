class Supervisor::CourseSubjectsController < Supervisor::BaseController
  before_action :load_course, only: [:index, :update]

  def index
    @course_subjects = @course.course_subjects
  end

  def update
    if @course.users.include? current_user or @course.owner == current_user
      change_status
    else
      respond_to do |format|
        format.js {@not_supervisor = I18n.t "flash.only_supervisor"}
      end
    end
  end

  private
  def change_status
    @course_subject = CourseSubject.find params[:id]
    if @course_subject.pending?
      @course_subject.status = :starting
    elsif @course_subject.starting?
      @course_subject.status = :finished
    end
    if @course_subject.save
      @course_subjects = @course.course_subjects
      respond_to do |format|
        format.js{}
      end
    end
  end
end
