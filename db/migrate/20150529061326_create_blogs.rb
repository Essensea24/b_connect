class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :country
      t.string :description
      t.string :photo
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :blogs, :users
  end
end
