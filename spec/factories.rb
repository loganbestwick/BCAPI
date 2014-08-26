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

	sequence :time_start do
		Time.now
	end

	sequence :time_end do
		Time.now
	end

	sequence :duration do
		745
	end

	sequence :challenge_id do |i|
		i
	end

	sequence :user_id do |i|
		i
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
		challenge_id
	end

	factory :workout do
		time_start
		time_end
		duration
		challenge_id
		user_id
	end
end