require 'spec_helper'

feature "User management" do
	scenario "Creating a valid User" do
		visit new_user_path
		
		fill_in 'Username', with: "validName"
		fill_in 'Password', with: "password"
		fill_in 'Confirm Password', with: "password"
		click_button 'Submit'

		expect(page).to have_content "Registration was successful"
	end
end
