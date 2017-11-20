class AddEnrollmentGroupid < ActiveRecord::Migration[5.1]
  def change
    change_table :enrollments do |t|
      t.integer :group_id
    end
  end
end
