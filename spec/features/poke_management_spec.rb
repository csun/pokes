require 'spec_helper'

feature 'Viewing pokes' do
	background do
		@user = FactoryGirl.create(:user)
		login_as @user
	end

	scenario 'when a user has received none' do
		visit user_path @user

		find('#pokes').should have_content "No pokes here!"
	end

	scenario 'when a user has received some' do
		sender = FactoryGirl.create(:user)
		FactoryGirl.create(:poke, sender_id: sender.id, receiver_id: @user.id)

		visit user_path @user
		find('#pokes').should have_content sender.username

		visit user_path @user
	end
end