FactoryGirl.define do 
	factory :user do
		name "John Smith"
		email "john@mail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end