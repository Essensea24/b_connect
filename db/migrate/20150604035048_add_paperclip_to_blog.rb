class AddPaperclipToBlog < ActiveRecord::Migration
  def change
  	add_attachment :blogs, :image  
  end
end
