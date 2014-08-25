require 'spec_helper'

describe 'GET /v1/challenges/:id' do
	it 'returns a challenge by :id' do
		challenge = create(:challenge)

		get "/v1/challenges/#{challenge.id}"

		expect(JSON.parse(response.body)).to eq(
			{
				'id' => challenge.id,
				'name' => challenge.name,
				'password' => challenge.password,
				'start_date' => challenge.start_date.to_i,
				'created_at' => challenge.created_at.to_i,
				'updated_at' => challenge.updated_at.to_i
			}
		)
	end
end

describe 'POST /v1/challenges' do
	it 'saves the challenge details' do
		date = Time.zone.now

		post '/v1/challenges', {
			name: 'Challenge',
			password: 'pWordddd',
			start_date: date
		}, {'Content-Type' => 'application/json'}

		challenge = Challenge.last
		expect(JSON.parse(response.body)).to eq({'id' => challenge.id})
		expect(challenge.name).to eq 'Challenge'
		expect(challenge.password).to eq 'pWordddd'
		expect(challenge.start_date.to_i).to eq date.to_i
	end
end

describe 'DELETE /v1/challenges/:id' do
	it 'deletes the challenge with :id' do
		challenge = create(:challenge)
		expect{delete "/v1/challenges/#{challenge.id}"}.to change{Challenge.all.count}.by(-1)
	end
end

describe 'PUT /v1/challenges/:id' do
	it 'updates a challenge' do
		challenge = create(:challenge)

		put "/v1/challenges/#{challenge.id}", {
			name: 'Doggies',
			password: challenge.password,
			start_date: challenge.start_date,
			created_at: challenge.created_at,
			updated_at: challenge.updated_at
		}, {'Content-Type' => 'application/json'}

		challenge.reload
		expect(challenge.name).to eq 'Doggies'
	end
end