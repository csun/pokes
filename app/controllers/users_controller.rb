class UsersController < ApplicationController
	def new 
		@user = User.new
	end

	def create
		@user = User.new(params[:user].permit(:username,:password,:password_confirmation))
		valid = @user.save
		
		if valid
			flash[:notice] = "Registration was successful"
			redirect_to @user
		else
			flash[:alert] = "Invalid username or password"
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
