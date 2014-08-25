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