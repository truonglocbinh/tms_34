class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :course_subject_tasks
  has_many :user_tasks
  has_many :users, through: :user_tasks

  validates :description, presence: true, length: {minimum: 1}
  validates :name, presence: true, length: {maximum: 50}
end
