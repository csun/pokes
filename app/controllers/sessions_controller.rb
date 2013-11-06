class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:username], params[:password])

		if user
			flash[:notice] = "Welcome, " + user.username
			session[:user_id] = user.id
			redirect_to root_path
		else
			flash[:alert] = "Invalid username or password"
			redirect_to new_session_path
		end
	end

	def destroy
		if session[:user_id]
			session[:user_id] = nil
			flash[:notice] = "Successfully logged out"
		end
		redirect_to root_path
	end
end