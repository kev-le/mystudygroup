class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.float :percentage
      t.text :lettergrade

      t.timestamps null: false
    end
  end
end
