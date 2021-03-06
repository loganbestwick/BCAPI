class Api::V1::WorkoutsController < ApplicationController

	def create
		@workout = Workout.new(workout_params)
		if @workout.save
			render
		end
	end

	def show
		@workout = Workout.find(params[:id])
	end

	def challenge_index
		@workouts = Workout.where(:challenge_id => params[:challenge_id]).limit(20)
	end

	def user_index
		@workouts = Workout.where(:user_id => params[:user_id]).limit(20)
	end

	private

	def workout_params
		{
			time_start: params[:time_start],
			time_end: params[:time_end],
			duration: params[:duration],
			challenge_id: params[:challenge_id],
			user_id: params[:user_id]
		}
	end

end