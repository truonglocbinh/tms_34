class Supervisor::SubjectsController < ApplicationController
  before_action :load_subjects, except: [:index, :new, :create]

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "flash.create_subject"
      redirect_to [:supervisor, @subject]
    else
      render :new
    end
  end
  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :description, :order, :_destroy]
  end
  def load_subjects
    @subject = Subject.find params[:id]
  end
end
