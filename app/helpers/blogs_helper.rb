module BlogsHelper

	def toggle_like_button(blog, current_user)
		if current_user.flagged?(blog, :like) and current_user.id == flag.user_id
			link_to "unlike", like_blog_path(blog)
		else 
			link_to "like", like_blog_path(blog)
		end
	end
end
