class UserTask < ActiveRecord::Base
  belongs_to :course_subject
  belongs_to :user
  belongs_to :task
end
