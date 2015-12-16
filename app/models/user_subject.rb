class UserSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :user_tasks

  scope :by_user_of_subject, ->user, course{where course_id: course.id, user_id: user.id}

  accepts_nested_attributes_for :user_tasks, allow_destroy: true,
    reject_if: proc{|a| a[:task_id] == "0"}

end
