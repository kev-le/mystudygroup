class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.text :name
      t.text :description

      t.timestamps null: false
    end
  end
end
