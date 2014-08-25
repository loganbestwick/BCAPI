json.cache! challenge do
	json.id challenge.id
	json.name challenge.name
	json.password challenge.password
	json.start_date challenge.start_date.to_i
	json.created_at challenge.created_at.to_i
	json.updated_at challenge.updated_at.to_i
end