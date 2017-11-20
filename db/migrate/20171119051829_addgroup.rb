class Addgroup < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :course_id

      t.timestamps
    end
  end
end
