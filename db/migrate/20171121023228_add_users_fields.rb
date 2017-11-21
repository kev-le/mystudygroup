class AddUsersFields < ActiveRecord::Migration[5.1]
  def change
    drop_table :users

    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :role

      t.timestamps
    end

    change_table :users do |t|
      t.text :bio
      t.string :school
      t.string :faculty
    end
  end
end
