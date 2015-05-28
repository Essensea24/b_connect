class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :about_me
      t.string :blog_page
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
