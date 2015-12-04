class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.integer :type_id
      t.string :action_type
      t.timestamps null: false
    end
  end
end
