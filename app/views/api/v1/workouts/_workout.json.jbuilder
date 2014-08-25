json.cache! workout do
	json.id workout.id
	json.time_start workout.time_start.to_i
	json.time_end workout.time_end.to_i
	json.duration workout.duration
	json.challenge_id workout.challenge_id
	json.user_id workout.user_id
end