class ChangeCourseSubject < ActiveRecord::Migration
  def change
    remove_column :course_subjects, :course_subject_id
    remove_column :course_subjects, :task_id
    add_column    :course_subjects, :end_date, :date
    add_column    :course_subjects, :course_id, :integer
    add_column    :course_subjects, :subject_id, :integer
  end
end
