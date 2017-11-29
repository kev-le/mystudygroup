class AddLocationToGroup < ActiveRecord::Migration[5.1]
  def change
    change_table :groups do |t|
      t.string :location_description
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
