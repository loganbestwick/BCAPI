require 'spec_helper'

describe 'GET /v1/users/:id' do
	it 'returns a user by :id' do
		user = create(:user)

		get "/v1/users/#{user.id}"

		expect(JSON.parse(response.body)).to eq(
			{
				'id' => user.id,
				'first_name' => user.first_name,
				'last_name' => user.last_name,
				'email' => user.email,
				'password' => user.password,
				'total_burpees' => user.total_burpees,
				'total_time' => user.total_time,
				'num_workouts' => user.num_workouts,
				'notifications' => user.notifications,
				'best_workout_id' => user.best_workout_id,
				'challenge_id' => user.challenge_id
			}
		)
	end
end

describe 'GET /v1/challenges/:challenge_id/users' do
	it 'returns a list of users by :challenge_id' do
		challenge = create(:challenge)
		5.times {
			User.create(first_name: 'l', last_name: 'm', email: 'n', password: 'ign', challenge_id: challenge.id, best_workout_id: 32)
		}

		get "/v1/challenges/#{challenge.id}/users"

		expect(JSON.parse(response.body)["users"].length).to eq(5)
		expect(JSON.parse(response.body)["users"][0]["challenge_id"]).to eq(challenge.id)
	end
end

describe 'POST /v1/users' do
	it 'saves a new user' do
		post 'v1/users', {
			first_name: 'Logan',
			last_name: 'Bestwick',
			email: 'loganbestwick@gmail.com',
			password: 'dogglife',
		}, {'Content-Type' => 'application/json'}

		user = User.last
		expect(JSON.parse(response.body)).to eq({'id' => user.id})
		expect(user.first_name).to eq 'Logan'
		expect(user.last_name).to eq 'Bestwick'
		expect(user.email).to eq 'loganbestwick@gmail.com'
		expect(user.password).to eq 'dogglife'
	end
end

describe 'DELETE /v1/users/:id' do
	it 'deletes a user with :id' do
		user = create(:user)
		expect{delete "/v1/users/#{user.id}"}.to change{User.all.count}.by(-1)
	end
end

describe 'PUT /v1/users/:id' do
	it 'updates a user with :id' do
		user = create(:user)
		last_name_old = user.last_name

		put "/v1/users/#{user.id}",
		{
			first_name: 'Harry',
			last_name: user.last_name,
			email: user.email,
			password: user.password
		}, {'Content-Type' => 'application/json'}

		user.reload
		expect(user.first_name).to eq "Harry"
		expect(user.last_name).to eq last_name_old
	end
end