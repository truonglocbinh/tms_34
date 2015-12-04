class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  has_many :course_subject_tasks
  has_many :user_tasks

  validates :course_id, uniqueness: {scope: :subject_id}
end
