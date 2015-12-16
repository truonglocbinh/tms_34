class ChangeNameinCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :create_by, :user_id
  end
end
