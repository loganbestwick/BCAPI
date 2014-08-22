FactoryGirl.define do

	sequence :name do
		'Logan'
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

end