class CourseSubject < ActiveRecord::Base
  enum status: [:pending, :starting, :finished]
  belongs_to :course
  belongs_to :subject
  has_many :course_subject_tasks
  has_many :user_tasks

  validates :course_id, uniqueness: {scope: :subject_id}
  accepts_nested_attributes_for :subject
  before_create :set_default_status

  private
  def set_default_status
    self.status = :pending if status.nil?
  end
end
