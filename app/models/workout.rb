class Workout < ActiveRecord::Base
	attr_protected
	belongs_to :user
	belongs_to :challenge
	validates_presence_of :time_start, :time_end, :duration, :challenge_id, :user_id
end