class Api::V1::UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			render
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.where(:challenge_id => params[:challenge_id])
	end

	def destroy
		@user = User.find(params['id'])
		@user.destroy
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render
		else
			render json: {
				message: 'Validation Failed',
				errors: @event.errors.full_messages
			}, status: 422
		end
	end

	private

	def user_params
		{
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email],
			password: params[:password],
			challenge_id: params[:challenge_id],
			best_workout_id: params[:best_workout_id]
		}
	end

end