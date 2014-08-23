class Api::V1::ChallengesController < ApplicationController

	def create
		@challenge = Challenge.new(challenge_params)
		if @challenge.save
			render
		end
	end

	def show
		@challenge = Challenge.find(params[:id])
	end

	def update
		@challenge = Challenge.find(params[:id])
		if @challenge.update_attributes(challenge_params)
			render
		else
			render json: {
				message: 'Validation Failed',
				errors: @event.errors.full_messages
				}, status: 422
		end
	end

	def destroy
		@challenge = Challenge.find(params[:id])
		@challenge.destroy
	end

	private

	def challenge_params
		{
			name: params[:name],
			password: params[:password],
			start_date: params[:start_date]
		}
	end

end