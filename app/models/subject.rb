class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :user_subjects
  has_many :users, through: :user_subjects
  has_many :tasks, dependent: :destroy, inverse_of: :subject

  validates :description, presence: true, length: {minimum: 1}
  validates :name, presence: true, length: {maximum: 50}
  accepts_nested_attributes_for :tasks, reject_if: :all_blank
end
