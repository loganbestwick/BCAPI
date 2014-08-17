class Challenge < ActiveRecord::Base
	attr_protected
	has_many :users
	has_many :workouts
end