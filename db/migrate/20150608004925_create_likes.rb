class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :username
      t.references :user, index: true
      t.references :blog, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :users
    add_foreign_key :likes, :blogs
  end
end
