require 'spec_helper'

describe UsersController do
	describe "POST /users" do
		context "with a valid User" do
			before do
				@initial_users_count = User.count
				post :create, user: FactoryGirl.attributes_for(:user)
			end

			it "creates a new User" do
				User.count.should eq @initial_users_count + 1
			end

			it "redirects to the new User" do
				response.should redirect_to User.last
			end
		end

		context "with an invalid User" do
			before do
				@initial_users_count = User.count
				user = FactoryGirl.build(:user, password_confirmation: "wrong")
				post :create, user: user.attributes
			end

			it "does not create a new User" do
				User.count.should eq @initial_users_count
			end

			it "redirects to the new User page" do
				response.should redirect_to new_user_path
			end
		end
	end
end
