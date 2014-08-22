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