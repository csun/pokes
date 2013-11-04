require 'spec_helper'

feature 'Session management' do
	background do
		@user = FactoryGirl.create(:user)

		visit new_session_path
	end
	
	scenario 'valid login attempt' do
		fill_in 'Username', with: @user.username
		fill_in 'Password', with: @user.password
		click_button 'Login'

		expect(page).to have_content "Welcome, " + @user.username
	end

	scenario 'invalid login attempt' do
		fill_in 'Username', with: "wrong"
		fill_in 'Password', with: "alsowrong"
		click_button 'Login'

		expect(page).to have_content "Invalid username or password"
	end
end