class Document < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.attachment :file
    end
  end
end
