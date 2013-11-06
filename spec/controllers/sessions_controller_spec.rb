require 'spec_helper'

describe SessionsController do
	describe 'POST /sessions' do
		context 'with a valid login attempt' do
			before do
				@user = FactoryGirl.create(:user)
				login_as @user
			end

			it 'sets user_id in session' do
				session[:user_id].should eq @user.id
			end
		end
	end

	describe 'GET /logout' do
		context 'when already logged in' do
			before do
				@user = FactoryGirl.create(:user)
				login_as @user
			end

			it 'sets user_id in session back to nil' do
				get :destroy
				session[:user_id].should be_nil
			end
		end
	end
end

def login_as(user)
	post :create, username: @user.username, password: @user.password
end