require 'spec_helper'

describe 'GET /v1/workouts/:id' do
	it 'returns a workout by :id' do
		workout = create(:workout)

		get "/v1/workouts/#{workout.id}"

		expect(JSON.parse(response.body)).to eq(
				{
					'id' => workout.id,
					'time_start' => workout.time_start.to_i,
					'time_end' => workout.time_end.to_i,
					'duration' => workout.duration,
					'challenge_id' => workout.challenge_id,
					'user_id' => workout.user_id
				}
			)
	end
end

describe 'GET /v1/challenges/:challenge_id/workouts' do
	it 'returns a list of workouts from challenge :id' do
		challenge = create(:challenge)
		20.times {
			Workout.create(time_start: Time.now, challenge_id: challenge.id, user_id: 1, time_end: Time.now, duration: 4)
		}

		get "/v1/challenges/#{challenge.id}/workouts"

		expect(JSON.parse(response.body)["workouts"].length).to eq(20)
		expect(JSON.parse(response.body)["workouts"][0]["challenge_id"]).to eq(challenge.id)
	end
end

describe 'GET /v1/users/:user_id/workouts' do
	it 'returns a list of workouts from user :id' do
		user = create(:user)
		20.times {
			Workout.create(time_start: Time.now, challenge_id: 1, user_id: user.id, time_end: Time.now, duration: 4)
		}

		get "/v1/users/#{user.id}/workouts"

		expect(JSON.parse(response.body)["workouts"].length).to eq (20)
		expect(JSON.parse(response.body)["workouts"][0]["user_id"]).to eq(user.id)
	end
end

describe 'POST /v1/workouts' do
	it 'saves a workout' do
		time1 = Time.now
		time2 = Time.now

		post '/v1/workouts', {
			time_start: time1,
			time_end: time2,
			duration: time2.to_i - time1.to_i,
			challenge_id: 4,
			user_id: 6
		}, {'Content-Type' => 'application/json'}

		workout = Workout.last
		expect(JSON.parse(response.body)).to eq({'id' => workout.id})
		expect(workout.time_start.to_i).to eq time1.to_i
		expect(workout.time_end.to_i).to eq time2.to_i
		expect(workout.duration.to_i).to eq (time2.to_i - time1.to_i)
		expect(workout.challenge_id).to eq 4
		expect(workout.user_id).to eq 6
	end
end