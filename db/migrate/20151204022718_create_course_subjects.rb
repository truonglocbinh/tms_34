class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.references :course_subject, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.integer    :status
      t.timestamps null: false
    end
  end
end
