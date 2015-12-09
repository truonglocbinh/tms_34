class Supervisor::CourseSubjectsController < ApplicationController
  before_action :load_course, only: [:index]
  def index
    @subjects = Subject.all
    @course_subjects = @course.course_subjects
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
