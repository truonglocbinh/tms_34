class AddUserSubjectIdToUserTask < ActiveRecord::Migration
  def change
    add_column :user_tasks, :user_subject_id, :integer
  end
end
