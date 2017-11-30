class AddImageToGroup < ActiveRecord::Migration[5.1]
  def change
    add_attachment :groups, :image  
  end
end
