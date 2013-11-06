require 'spec_helper'

feature 'Logging in' do
	scenario 'valid login attempt' do
		user = FactoryGirl.create(:user)
		login_as user

		expect(page).to have_content "Welcome, " + user.username
	end

	scenario 'invalid login attempt' do
		visit login_path

		fill_in 'Username', with: "wrong"
		fill_in 'Password', with: "alsowrong"
		click_button 'Login'

		expect(page).to have_content "Invalid username or password"
	end
end

feature 'Logging out' do
	scenario 'correct logout' do
		user = FactoryGirl.create(:user)
		login_as user

		visit logout_path

		expect(page).to have_content "Successfully logged out"
		current_path.should eq root_path
	end

	scenario 'attempted logout while not logged in' do
		visit logout_path

		expect(page).to_not have_content "Successfully logged out"
		current_path.should eq root_path
	end
end


def login_as(user)
	visit login_path

	fill_in 'Username', with: user.username
	fill_in 'Password', with: user.password
	click_button 'Login'
end