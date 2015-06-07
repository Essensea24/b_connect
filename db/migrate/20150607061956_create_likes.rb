class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :blog, index: true
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :users
    add_foreign_key :likes, :blogs
    add_foreign_key :likes, :comments
  end
end
