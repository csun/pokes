require 'spec_helper'

describe SessionsController do
	describe "POST /sessions" do
		context "with a valid login attempt" do
			before do
				@user = FactoryGirl.create(:user)
				post :create, username: @user.username, password: @user.password
			end

			it "sets user_id in session" do
				session[:user_id].should eq @user.id
			end
		end
	end
end
