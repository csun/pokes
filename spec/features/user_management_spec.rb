require 'spec_helper'

feature "User management" do
	scenario "Registering a valid User" do
		visit new_user_path
		
		fill_in 'Username', with: "validName"
		fill_in 'Password', with: "password"
		fill_in 'Confirm Password', with: "password"
		click_button 'Submit'

		expect(page).to have_content "Registration was successful"
	end

	scenario "Registering an invalid User" do
		visit new_user_path
		
		fill_in 'Username', with: "validName"
		fill_in 'Password', with: "password"
		fill_in 'Confirm Password', with: "wrong"
		click_button 'Submit'

		expect(page).to have_content "Invalid username or password"
	end
end
