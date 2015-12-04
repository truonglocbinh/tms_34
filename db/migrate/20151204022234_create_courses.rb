class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.integer :create_by
      t.date :finished
      t.timestamps null: false
    end
  end
end
