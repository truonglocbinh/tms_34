class Supervisor::CoursesController < Supervisor::BaseController
  before_action :load_course, except: [:index, :new, :create]
  before_action :verify_supervisor, only: [:update]

  def index
    @courses = Course.all.paginate page: params[:page]
  end

  def new
    @course = Course.new
    @subjects = Subject.all
    @subjects.each do |subject|
      @course.course_subjects.build subject_id: subject.id
    end
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "flash.create_course"
      redirect_to supervisor_root_url
    else
      @subjects = Subject.all
      @subjects.each do |subject|
        @course.course_subjects.build subject_id: subject.id
      end
      render :new
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "flash.subject_update_success"
      redirect_to :back
    else
      flash[:danger] = t "flash.subject_update_failed"
      redirect_to :back
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date,
      :status, :create_by, course_subjects_attributes:[:id, :course_id, :subject_id]
  end

  def load_course
    @course = Course.find params[:id]
  end

  def verify_supervisor
    unless @course.users.include? current_user
      flash[:danger] = t "flash.only_supervisor"
      redirect_to :back
    end
  end
end
