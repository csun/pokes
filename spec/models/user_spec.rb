require 'spec_helper'

describe User do
	describe "User validations" do
		before(:each) do
			@user = FactoryGirl.build(:user)
		end
		
		it "is invalid without a username" do
			@user.username = nil
			@user.should be_invalid
		end

		it "is invalid if username is not unique" do
			@user.save
			indentical_user = FactoryGirl.build(:user, username: User.first.username)
			indentical_user.should be_invalid
		end

		it "is invalid without a password" do
			@user.password = nil
			@user.should be_invalid
		end

		it "is invalid if password and password_confirmation are not identical" do
			@user.password_confirmation = "not_identical"
			@user.should be_invalid
		end

		it "should have a password_salt and password_hash after saving" do
			@user.password_hash.should_not be_present
			@user.password_salt.should_not be_present
			@user.save
			@user.password_hash.should be_present
			@user.password_salt.should be_present
		end
	end

	it "can authenticate based on a username and password" do
		user = FactoryGirl.create(:user)
		authenticated = User.authenticate(user.username, user.password)
		authenticated.should eq user
	end
end
