class SessionsController < ApplicationController

	
	def new

	end

	def create
		user = User.find_by(email: params[:login][:email]) #find by email, which is the login email that user input on the login session
		if user && user.authenticate(params[:login][:password]) # no == true required, rails knows we wants the both values to be true
			session[:user_id] = user.id.to_s #create cookie for this session
			redirect_to user_path(user), notice: "Welcome, you are now login."
		else
		 	render :new
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end
end
