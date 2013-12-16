FactoryGirl.define do
	factory :user do
		sequence(:username) { |n| "user#{n}" }
		password "password"
		password_confirmation { |u| u.password }
	end
end
