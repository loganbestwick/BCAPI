class Challenge < ActiveRecord::Base
	attr_protected
	has_many :users
	has_many :workouts
	validates_presence_of :name, :password, :start_date
end