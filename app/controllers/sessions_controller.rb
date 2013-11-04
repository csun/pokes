class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_username(params[:username])

		if valid_credentials
			flash[:notice] = "Welcome, " + @user.username
			redirect_to root_path
		else
			flash[:alert] = "Invalid username or password"
			redirect_to new_session_path
		end
	end

	def valid_credentials
		return false if @user == nil
		
		hashed_param = BCrypt::Engine.hash_secret(params[:password], @user.password_salt)
		@user.password_hash == hashed_param
	end

	private :valid_credentials
end
