class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects
  has_many :subject, through: :course_subjects

  validates :create_by, presence: true
  validates :description, presence: true, length: {minimum: 100}
  validates :end_date, presence: true
  validate  :end_date_greate_or_equal_than_start_date
  validates :name, presence: true, length: {maximum: 50}
  validates :status, presence: true
  validates :start_date, presence: true

  scope :latest, -> {order created_at: :desc}
  scope :active, -> {where "is_active = ?" , true}

  private
  def end_date_greate_or_equal_than_start_date
    if start_date > end_date
      errors.add(:start_date, t("errors.course.start_end"))
    end
  end
end
