class AddGroupIdToDocuments < ActiveRecord::Migration[5.1]
  def change
    change_table :documents do |t|
      t.integer :group_id
    end
  end
end
