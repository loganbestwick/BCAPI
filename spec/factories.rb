FactoryGirl.define do

	sequence :name do
		'Logan'
	end

	sequence :first_name do
		'John'
	end

	sequence :last_name do
		'Landers'
	end

	sequence :email do
		'jlanders@gmail.com'
	end

	sequence :password do
		'randoPword'
	end

	sequence :start_date do
		Time.zone.now
	end

	factory :challenge do
		name
		password
		start_date
	end

	factory :user do
		first_name
		last_name
		email
		password
	end

end